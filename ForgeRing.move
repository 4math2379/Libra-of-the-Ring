module ForgeRing {

//made the adequat struct
import Transaction.Math;
import 0x0.Block;
 

//resource for everything...
resource Ring {        
	name: bytearray,
        RingNum: u64,        
	level: u64,
        cost: u64,        
	aura: u64    }
        




	resource RingStats {
	stats: u64
}

public generateSerial(SerialLimit: u64) : u64 {
        let SerialNum: u64;
        
//serial number of the ring are  
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
        public newRings (_name:bytearray, _SerialNum: u64) : Self.Ring {
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
	
	assert(get_txn_sender() -- 0x0000000, 1);
}



        }
