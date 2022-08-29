use std::collections::HashMap;
use std::io;
use std::str::FromStr;

fn _read_values<T: FromStr>() -> Result<Vec<T>, T::Err> {
    let mut str = String::new();
    io::stdin()
        .read_line(&mut str)
        .expect("Failed to read from stdin!");
    str.trim()
        .split_whitespace()
        .map(|word| word.parse())
        .collect()
}

fn main() {
    let lower: u32 = 0;
    let upper: u32 = 10;

    let mut vec: Vec<u32> = (lower..=upper).collect();
    for ele in &mut vec {
        *ele = *ele + 10;
    }

    for new_val in 100..=120 {
        if new_val % 2 == 0 {
            vec.push(new_val)
        }
    }

    println!("{:?}", vec);

    let keys = vec![1, 2, 3, 4];
    let vals = [
        String::from("First"),
        String::from("Second"),
        String::from("Third"),
        String::from("Fourth"),
    ];

    let mut map: HashMap<_, _> = keys.into_iter().zip(vals.into_iter()).collect();
    println!("{:?}", map);

    let new_key = 5;
    let new_val = String::from("Fifth");
    map.insert(new_key, new_val);

    println!("{:?}", map);

    let key = 1;
    let out_of_the_map = match map.get(&key) {
        Some(string) => string,
        None => panic!("get method on key {} returned a invalid value!", key),
    };

    println!("{:?}", out_of_the_map);
    println!("{:?}", map);

    println!("Counting words from now on! ");

    let mut map = HashMap::new();
    let new_text = "dumb phrase for testing";
    for word in new_text.split_whitespace() {
        let count = map.entry(word).or_insert(0);
        *count += 1
    }

    println!("\n{:?}", map);
    map.into_iter().for_each(|(key, _value)| {
        key.chars()
            .enumerate()
            .for_each(|(letter, _letter_idx)| println!("{} ", letter))
    })
}
