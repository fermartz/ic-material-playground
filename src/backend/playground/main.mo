import L "mo:base/List";
import A "mo:base/AssocList";

actor {
    // Counter result
    stable var currentValue: Nat = 0;
    // Calculator result
    var cell : Int = 0;
    // Counter increment
    public func increment(): async () {
        currentValue += 1;
    };
    // Get Counter val
    public query func getValue(): async Nat {
        currentValue;
    };

    // Get query for hello world
    public query func hello() : async Text {
        return "Hello world from Internet Computer!";
    };
    // Get message for greeting
    public func greet(msg : Text) : async Text {
        return msg;
    };

    // START CALCULATOR
    // Define functions to add, subtract, multiply, and divide
    public func add(n:Int) : async Int { cell += n; cell };
    public func sub(n:Int) : async Int { cell -= n; cell };
    public func mul(n:Int) : async Int { cell *= n; cell };
    public func div(n:Int) : async ?Int {
        if ( n == 0 ) {
        return null // null indicates div-by-zero error
        } else {
        cell /= n; ?cell
        }
    };
    // Clear the calculator and reset to zero
    public func clearall() : async Int {
        if (cell : Int != 0)
        cell -= cell;
        return cell
    };
    // Get calculator value
    public query func getCalculatorResult(): async Int {
        cell;
    };

    // END CALCULATOR
};
