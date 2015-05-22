# WHAT IS THIS

An early foray in the world of TDD in iOS. StringReverse is the exercise found at https://robots.thoughtbot.com/test-driving-ios-a-primer, but done with a top down BDD approach instead.

# WHAT IT DOES

StringReverse is a custom UITableViewCell subclass that:
- Takes a string
- Reverses the string
- Sets the string as the text on its label

# TDD APPROACH

I’ve chosen to go with a top down approach, which lends itself to the mockist style. While the approach has its drawbacks, I felt that I would learn the most from having my tests drive the design of the architecture rather than just the implementation. Need based if you would.

Syntactically, I liked what BDD frameworks like Specta encourage. For naming the tests themselves, I really liked the scenario approach of using WHEN and SHOULD while avoiding specifying implementation details. It lends itself well to GUI based applications.

# UI

Note that as the scope was to replicate the article, I started top down from the UITableViewCell subclass rather than the ViewController and Storyboard. It is also why I chose to create the reverseLabel in code rather than the storyboard.

The ViewController code was not test driven; I coded it as a sanity check.

In a future project, I hope to use Gherkin style tests with Appium to drive the design from the top most layer. I’ll have a better idea of how tests can work with the design and loading of UI elements then.

# WHY COMMENTED OUT CODE

You will notice some code and tests that are commented out. The commented out test found in ReverseStringCellSpec.m was my first approach to the problem. However, when coding an implementation of the StringReverser Protocol, I felt I could refactor and shift my approach to using a Category instead. I left it commented out to show both approaches.

# PONDERINGS

### FIRST PARTY FRAMEWORKS

I’ve come across the concept of “only mock what you own” to the extent that a mockist creates Protocols that wrap other libraries. However, I felt that perhaps 1st party frameworks (Apple code) could be treated differently, that perhaps coupling to it isn’t so bad. Wrapping complex Apple objects felt like a waste because I’m working on the Apple platform itself and I don’t expect that to change for this codebase.

In the commented out test, I had actually attempted to avoid mocking the UILabel itself. Instead, I tried to test the state of an object I do not own (which isn’t very mockist).

However, once I went with categories, I realized I had to mock NSString anyways. At that point, I figured I might as well mock the UILabel and go with behavior verification.

### MOCKIST AND CATEGORIES

The mockist approach doesn’t appear to lend itself well to Categories. Instead of adding on behavior to an existing class, it tends to push responsibility down the chain to a new object (single responsibility). This is why my initial approach in the commented out test used a StringReverser Protocol, meant to create a dependency that could be injected into the ReverseStringCell.

I admit that I am biased in that I feel Categories are useful and the original article used them as well, so I tried to force it to work regardless.

Still, the way I ended up forcing it has coupled ReverseStringCell to NSString+Reversed. While NSString may be a first party framework, the Category is not. So perhaps the original approach of having an object dedicated to reversing strings was cleaner.

On another note, I considered using a Protocol for the NSString Category. That way, I could have a Category and tie everything to a Protocol. I couldn’t figure out how to get it to work though as Categories behave so differently.

### LONG TESTS (WHEN X IT SHOULD Y AND Z)

I wasn’t sure if having a long test with multiple shoulds was good practice. If the order doesn’t matter, I can break it up into separate test. It’s another story if order matters though.

My conclusion so far is that it’s still single responsibility; the System Under Test is responsible for delegating work to its dependencies rather than doing any work itself.

### ARE MY TESTS TAUTOLOGICAL AND OVERKILL?

For the “when given a string, it should display the string in reverse” test, the expectations that are verified practically match the actual code one for one. That could be a test smell.

### TO PROTOCOL OR NOT TO PROTOCOL

Mockist TDD lends itself to a ton of Protocols. It feels like over-design, but then again the result is loose coupling. I think I need to divorce myself of this fear and just use a ton of Protocols. No more copping out and using a Category.

For the next exercise:
- Avoid Categories, try going all mockist
- Use lots of Protocols
- To reduce the number of header files, if a Protocol is likely to only be used by a single class, leave it in the header of that class
- First party libraries are exempt; avoid Protocols here for now