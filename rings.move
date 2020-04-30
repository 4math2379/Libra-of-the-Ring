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


module ForgeRing  {
//made the adequat struct
import Transaction.Math;
import 0x0.Block;
   
 resource Ring { 
        name: bytearray,
        ringNum: u64,
        level: u64,
        cost: u64,
        aura: u64
    }

	resource Ringstats {
	stats: u64


	}


	public generateSerial(SerialLimit: u64) : u64 {
        let SerialNum: u64;
	
	//serial number of rings are ...
        RingNum = Math.myrand(Block.get_current_height()) % (copy(SerialLimit) - copy(SerialLimit) / 10) + copy(SerialLimit) / 10;
        return move(RingNum);
    }




	public cultures_ring (SerialNum: u64) : u64 * u64 {
	let culture : u64;
	
	//extract of the culture as a serial
	culture = ((move(SerialNum) / 10) % 10) % 5;
	if (copy(culture) == 0) {
		return 6, 6;

		}
	if (copy(culture) == 1) {
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

	public initRingstats () {

        assert(get_txn_sender() == 0x0000000000000000000000000a550c18, 1);
        
	move_to_sender<RingStats>(RingStats {sum: 0});        
	return;

	
	
	}


	public ringstats() : u64 acquire RingStats {
	let RingStats_ref : &mut Self.Ringstats;
	RingStats_ref = borrow_global_mut<RingStats>(0x0000000000000000000000000a550c18);
	


	//dereference after borrow the resources
	return *&move(RingStats_ref).sum;
	
	}




}



//create account for ring user

module RingAccount {
	//import module event
	import 0x0.Event;


	//procedure for create account	
	resource RingAccount {
	new_ring : ForgeRing.Ring
	account_events: Event.Handle<Self.AccountEvent>	

	}

	struct AccountEvent {
        flag: u64 
    }

	

	public newAccount (name:bytearray) : self.RingAccount {
	
		let SerialDigit : u64;
		let SerialLimit: u64;
		let RingNum: u64;
		let ring : ForgeRing.Ring;
		

		let event_handle: Event.Handle<Self.AccountEvent>;
        event_handle = Event.new_event_handle<Self.AccountEvent>();

		
		SerialDigits = 8;
		SerialLimit = Math.pow(10, copy(SerialDigits));
		RingNum = ForgeRing.generateSerial(copy(SerialLimit));

		//init the rings specs
		ring = ForgeRing.newRings(move(name), move(SerialNum));
		return RingAccount { new_ring: move(ring), , account_events: move(event_handle)};		

	}		

	
	public publishAccount (account: Self.RingAccount) acquires RingAccount

{
	let account_event: Self.AccountEvent;
       let account_add: address;
       let account_ref: &mut Self.CastleAccount;        
       account_add = get_txn_sender();
       account_ref = borrow_global_mut<RingAccount>(copy(account_add));
       account_event = AccountEvent { flag: 1 };
        
Event.emit_event<Self.AccountEvent>(&mut move(account_ref).account_events, move(account_event));	





	move_to_sender<RingAccount>move(account);
 			                                                                                                                               return;


	}

	
	
}






script:
import Transaction.ForgeRing;
import Transaction.Math;
import Transaction.RingAccount;
main(name: bytearray) {
let SerialDigits: u64;
let SerialLimit: u64;
let RingNum; u64;
// serial = blockNumber

//account
let account: RingAccount.RingAccount;
account =  RingAccount.newAccount(move(name));
RingAccount.publishAccount(move(account));



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
