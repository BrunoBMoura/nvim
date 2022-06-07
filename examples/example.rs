fn first_word(word : &str) -> &str {
    let bytes = word.as_bytes();
    for (idx, &item) in bytes.iter().enumerate() {
        if item == b" " {
            return &word[..idx];
        }
    }
    &word[..]
}

pub fn run(&mut self) -> Result<()> {
    let scene = self.scenes.get_mut(0).ok_or_else(|| anyhow!("No scene loaded"));
}

fn main() {

    let word = "Hello, world!";
    println!(" word is {}", word);
    println!(" first word is {}", first_word(word))

    return;
}
