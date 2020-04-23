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
