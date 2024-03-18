## INSTALLING
### bundler
```
bundle gem cardtrick
```
### gems
```
gem install cardtrick
```
## CREATING

### Card Decks

#### A standard deck of cards...
```
Cardtrick.deck("card", Cardtrick.decks[:standard])
```

#### Create historic decks...
```
Cardtrick.deck("tarot", Cardtrick.decks[:tarot])
```

#### Or roll your own decks...
```
Cardtrick.deck("cereal", {
                 suits: [:hearts, :stars, :diamonds, :clovers, :baloons],
                 faces: { leprechan: 10, rabbit: 1 },
                 numbers: { low: 3, high: 7 },
                 hand: 5,
                 specials: [
                   { suit: 'magic',
                     card: 'sugar',
                     value: 1000
                   }
                 ],
                 shuffle: true,
                 deck: 'tricks'
               })
```

### Dice

#### Simple Dice roll
```
Cardtrick.dice 'monopoly', num: 2, sides: 6, key: 'Monopoly'
```

#### Multipart Dice roll
```
Cardtrick.dice 'hp', num: 3, sides: 12, key: 'Hit Points'
Cardtrick.dice 'ac', num: 5, sides: 20, key: 'Armor'
```

#### Then create the roll... 
```
Cardtrick.roll 'vs', 'ac', 'hp'
```

### Coins

#### A simple coin for tossing
```
Cardtrick.coin 'quarter', heads: 'George Washington', tails: "The Bald Eagle", key: "A medium silver coin."
```

#### Multipart coin toss
```
Cardtrick.coin 'dime', heads: "A head", tails: "A building", key: "A small Silver Coin"
Cardtrick.coin 'penny', heads: "A bird", tails: "A tree", key: "A small copper coin"
```

#### Then create the toss..
```
Cardtrick.coins 'change', 'dime', 'penny'
```

#### Special "Magical" multisided coins...
```
Cardtrick.coin 'quartz', up: "a shiny face", down: "a scratched face", left: "a bright face", right: "a dim face", key: 'Rose Quartz'
Cardtrick.coin 'tigereye', up: "a shiny face", down: "a scratched face", top: "a bright face", bottom: "a dim face", key: 'Tiger Eye'
Cardtrick.coin 'ruby', up: "a shiny face", top: "a bright face", key: 'Ruby'
```

#### Just the same as before... 
```
Cardtrick.coins 'gems', 'quartz', 'tigereye', 'ruby'
```

## USING
### Card Decks
#### map each card in a hand (any deck)
```
Cardtrick['card'].map { |e| e }
Cardtrick['tarot'].map { |e| e }
Cardtrick['cereal'].map { |e| e }
```

### Dice
#### map each die in a roll
```
Cardtrick['monopoly'].map { |e| e }
```

#### map each die in a collection of rolls
```
Cardtrick['vs'].map { |e| e }
```

### Coins
#### map a single coin flip
```
Cardtrick['quarter'].map { |e| e }
```

#### map a collection of coin flips
```
Cardtrick['change'].map { |e| e }
```

#### once again...
```
Cardtrick['gems'].map { |e| e }
```
