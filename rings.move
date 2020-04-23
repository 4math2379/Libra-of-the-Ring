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
   
 resource Ring { 
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
	public cultures_ring (SerialNum: u64) : u64 * u64 {
	let culture : u64;
	
	//extract of the culture as a serial
	culture = ((move(SerialNum) / 10) % 10) % 5;
	if (copy(culture)) == 0) {
		return 6, 6;

		}
	if (copy(culture)) == 1) {
		return 8, 3;
		
		}
	if (copy(culture) == 2) {
            return 3, 8;
        }
        if (copy(culture) == 3) {
            return 7, 4;
        } else {
            return 4, 7;
   		
		}	  

	}	
	//create new rings
	public newRings	(_name:bytearray, _SerialNum: u64) : Self.Ring {
	let a: u64;
	let b: u64;
	//set culture for the ring
	a, b = Self.culture_motiv(copy(_SerialNum));
	//initialized the new ring struct
	return Ring {
		name:move(_name);
		SerialNum: copy(_SerialNum);
		level :1,
		cost : move(a),
		aura : move(b)
		};
	
}

//resource need to be destroy =>event

public destroyRing (ring: Self.Ring){
	let name: bytearray;
	let SerialNum: u64;
	let level : u64;
	let cost : u64;
	let aura : u64;

	Ring(name, SerialNum, level, cost, aura ) =move(ring);
return 
}



	
	
	}
//create account for ring user

module RingAccount {
	//procedure for create account	
resource RingAccount {
	a : u64;
	}
	

	public newAccount () : self.RingAccount {
	
	}		


	return RingAccount {a :0};
}



public destroyAccout (account: Self.RingAccount){
	let num: u64;
	RingAccount { num } = move(account);
	returm;


}



script:
import Transaction.ForgeRing;
import Transaction.Math;

main(name: bytearray) {
let SerialDigits: u64;
let SerialLimit: u64;
let RingNum; u64;
// serial = blockNumber


//declaratiom the new ring specs
let ring: Forgering.Ring;

SerialDigits = 8;
SerialLimit = Math.pow(10, copy(SerialDigits));
RingNum = ForgeRing.generateSerial(copy(SerialLimit));

//init the rings specs
ring = ForgeRing.newRings(move(name), move(SerialNum));

ForgeRing.destroyRing(move(ring));

return;


}
