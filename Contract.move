import Transaction.ForgeRing;
import Transaction.Math;

main(name: bytearray) {
let SerialDigits: u64;
let SerialLimit: u64;
let RingNum: u64;
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
