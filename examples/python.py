import random
import datetime

class DataGenerator:

    def __init__(self, file_name):
        self.file_name = file_name

    def generate_random_data(self, data_size, randomize = True):
        # Generate a list with <data_size> elements.
        random_vet = [num for num in range(data_size)]

        if randomize:
            # Randomize it 10 times.
            for _ in range(10):
                random.shuffle(random_vet)

        # Write the randomized elements to the file.
        with open(self.file_name, "w+") as file:
            for num in random_vet:
                string = f"{num}\n"
                file.write(string)

    def get_generated_data(self):
        return [int(line.split()[0]) for line in open(self.file_name, "r")]

""" Any string """
class Node:

    def __init__(self, key, parent = None):
        self.key = key
        self.parent = parent
        self.right = None
        self.left = None
        self.height = 1
        self.balancing_fact = 0

    def __str__(self):
        return str(self.key)

class AVLTree:

    def __init__(self):
        self.root = None
        self.num_nodes = 0

    def add_node(self, key):
        node = Node(key)
        if self.root is None:
            self._insert_as_root(node)
        else:
            self._insert(self.root, node)

        self.num_nodes += 1
        self.num_nodes = int(self.num_nodes)

    def remove_node(self, key):

        def _find_replacement(node):
            if node is None:
                return -1000000

            right_val = _find_replacement(node.right)
            left_val = _find_replacement(node.left)

            return max(left_val, right_val, node.key)

        def _remove(node):
            # node is a pure leaf node
            child_side = self._get_node_side(node)
            if node.right is None and node.left is None:
                node = None
            # if right subtree is None
            elif node.right is None and node.left:
                if child_side == "RIGHT":
                    self._insert_as_right(node.parent, node.left)
                elif child_side == "LEFT":
                    self._insert_as_left(node.parent, node.left)
                node = None
            # if left subtree is None
            elif node.left is None and node.right:
                if child_side == "RIGHT":
                    self._insert_as_right(node.parent, node.right)
                elif child_side == "LEFT":
                    self._insert_as_left(node.parent, node.right)
                node = None
            # if the node has both subtrees
            else:
                # find the value that will replace the removed key
                to_replace = _find_replacement(node.left)
                # remove the key that will replace the initial removed key
                node_to_replace = self._find_key(to_replace, node.left)
                _remove(node_to_replace)
                # reassign the key to the initial node
                node.key = to_replace

        node = self._find_key(key)
        if node is not None:
            _remove(node)

    def custom_print(self):

        def _print(node):
            if node is None:
                return

            self.get_node_info(node)
            if node.left:
                _print(node.left)
            if node.right:
                _print(node.right)
            return

        _print(self.root)
        print("")

    def get_node_info(self, node):
        if node == self.root:
            print(f"- [node ({node})] is the root and has height = ({node.height}),", end = "")
            print(f" with a ltree of height ({node.left.height}) and root ", end = "")
            print(f"({node.left}) and rtree of height ({node.right.height}) and root ({node.right})")
        else:
            print(f"- [node ({node})] is child of node ({node.parent}), and has left as ({node.left}) and ", end = "")
            print(f"right as ({node.right}) with [h = {node.height}]")

    def _insert(self, node, new_node):
        # check right subtree
        if node.key < new_node.key:
            if node.right is None:
                self._insert_as_right(node, new_node)
            else:
                self._insert(node.right, new_node)
        # thenb check left subtree
        else:
            if node.left is None:
                self._insert_as_left(node, new_node)
            else:
                self._insert(node.left, new_node)

        left_h, right_h = self._update_node_height(node)
        node.balancing_fact = left_h - right_h
        self._check_for_rotation(node)

    def _insert_as_left(self, parent, child):
        child.parent = parent
        parent.left = child
        self._update_node_height(parent)

    def _insert_as_right(self, parent, child):
        child.parent = parent
        parent.right = child
        self._update_node_height(parent)

    def _insert_as_root(self, node):
        node.parent = None
        self.root = node
        self._update_node_height(self.root)

    def _update_node_height(self, node):
        left_h = self._get_node_height(node.left)
        right_h = self._get_node_height(node.right)
        node.height = max(left_h, right_h) + 1

        return (left_h, right_h)

    def _get_node_side(self, node):
        if node.parent is None:
            return "ROOT"
        elif node.parent.key > node.key:
            return "LEFT"
        else:
            return "RIGHT"

    def _get_node_height(self, node):

        def _height(node):
            if node is None:
                return 0

            left_h = node.left.height if node.left else 0
            right_h = node.right.height if node.right else 0
            # locally update the node height when called after rotation
            node.height = max(left_h, right_h) + 1

            return node.height

        return _height(node)

    def _check_for_rotation(self, node):

        # simple right rotation
        if node.balancing_fact > 1 and node.left.balancing_fact == 1:
            self._right_rotation(node)
        # simple left rotation
        elif node.balancing_fact < -1 and node.right.balancing_fact == -1:
            self._left_rotation(node)
        # double right rotation
        elif node.balancing_fact > 1 and node.left.balancing_fact == -1:
            self._left_rotation(node.left)
            self._right_rotation(node)
        # double left rotation
        elif node.balancing_fact < -1 and node.right.balancing_fact == 1:
            self._right_rotation(node.right)
            self._left_rotation(node)

    def _right_rotation(self, node):
        pivot = node.left
        # align the possible right subtree of the pivot
        if pivot.right:
            self._insert_as_left(node, pivot.right)
        else:
            node.left = None
        # aligning the parent of the initial node to now be the pivot's parent
        child_side = self._get_node_side(node)
        if child_side == "LEFT":
            self._insert_as_left(node.parent, pivot)
        elif child_side == "RIGHT":
            self._insert_as_right(node.parent, pivot)
        else:
            self._insert_as_root(pivot)

        self._insert_as_right(pivot, node)

    def _left_rotation(self, node):
        pivot = node.right
        # align the possible left subtree of the pivot
        if pivot.left:
            self._insert_as_right(node, pivot.left)
        else:
            node.right = None
        # aligning the parent of the initial node to now be the pivot's parent
        child_side = self._get_node_side(node)
        if child_side == "LEFT":
            self._insert_as_left(node.parent, pivot)
        elif child_side == "RIGHT":
            self._insert_as_right(node.parent, pivot)
        else:
            self._insert_as_root(pivot)

        self._insert_as_left(pivot, node)

    def _find_key(self, key, start_node = None):

        def _find(node, key):
            if node is None:
                return None;

            found = None
            if key < node.key:
                found = _find(node.left, key)
            elif key > node.key:
                found = _find(node.right, key)
            else:
                found = node

            return found

        if start_node:
            found = _find(start_node, key)
        else:
            found = _find(self.root, key)

        return found

def main():

    file_name = "random_data.txt"
    num_ele = 100000
    generator = DataGenerator(file_name)
    generator.generate_random_data(num_ele)
    data = generator.get_generated_data()

    tree = AVLTree()
    initial_ref = datetime.datetime.now()
    for ele in data:
        tree.add_node(ele)

    tree.custom_print()
    tree.get_node_info(tree.root)
    total_time = datetime.datetime.now() - initial_ref
    print(f"Total insertion time of ({num_ele}) elements took ({total_time})")

    initial_ref = datetime.datetime.now()
    key = tree._find_key(50)
    total_time = datetime.datetime.now() - initial_ref
    if key:
        print(f"Total time to find element (50) was ({total_time})")
    else:
        print(f"Total time to find element (50) was ({total_time}), but it wasn't found")

    initial_ref = datetime.datetime.now()
    key = tree._find_key(50000)
    total_time = datetime.datetime.now() - initial_ref
    if key:
        print(f"Total time to find element (50000) was ({total_time})")
    else:
        print(f"Total time to find element (50000) was ({total_time}), but it wasn't found")


if __name__ == "__main__":
    main()
