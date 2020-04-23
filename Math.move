//module for calculate power and moremodule 


Math { public power(x: u64, n: u64 ) : u64 {            	if (copy(n) == 0) {            
return 1;        }        
	if (copy(n) == 1) {            
return move(x);        }        
	if (copy(n) % 2 == 0) {            
return Self.power(copy(x) * copy(x), copy(n) / 2);        } else {            
return Self.power(copy(x) * copy(x), copy(n) / 2) * copy(x);        
}        
	}        
public myrand(seed: u64) : u64 {          
let rand: u64;        
rand = move(seed) * 1103515245 + 12345;        
return (move(rand) / 65536) % 32768;    }
}
