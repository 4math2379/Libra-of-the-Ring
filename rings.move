//module for calculate power and more
module Math {       

 public power(x: u64, n: u64 ) : u64 {       
	if (copy(n) == 0) {
            return 1;
        }
        if (copy(n) == 1) {
            return move(x);
        }
        if (copy(n) % 2 == 0) {
            return Self.power(copy(x) * copy(x), copy(n) / 2);
        } else {
            return Self.power(copy(x) * copy(x), copy(n) / 2) * copy(x);
        }
         


	}
	public myrand(seed: u64) : u64 {
        let rand: u64;
        rand = move(seed) * 1103515245 + 12345;
        return (move(rand) / 65536) % 32768;
    }
}


module ForgeRing {
//made the adequat struct
import Transaction.Math;
import 0x0.Block;
   
 struct Ring { 
        name: bytearray,
        RingNum: u64,
        level: u64,
        cost: u64,
        aura: u64
    }
    public generateSerial(SerialLimit: u64) : u64 {
        let SerialNum: u64;
        RingNum = Math.myrand(Block.get_current_height()) % (copy(SerialLimit) - copy(SerialLimit) / 10) + copy(SerialLimit) / 10;
        return move(RingNum);
    }

}


script:
import Transaction.ForgeRing;
import Transaction.Math;

main() {
let SerialDigits: u64;
let SerialLimit: u64;
let RingNum; u64;


SerialDigits = 8;
SerialLimit = Math.pow(10, copy(SerialDigits));
RingNum = ForgeRing.generateSerial(copy(SerialLimit));
return;


}
