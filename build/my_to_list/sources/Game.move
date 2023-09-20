module MyAddr::Game{

    use std::signer;
    use std::debug;

    const STAR_EXIST :u64 = 100;
    const STAR_NOT_EXIST :u64 = 101;

    struct GameStar has key{
        name:vector<u8>,
        country:vector<u8>,
        position:u8,
        value:u8,
    }

    public fun createStar(name:vector<u8>,country:vector<u8>,position:u8):GameStar{
        return GameStar{name,country,position,value:0}
    }

    public fun mint(to:&signer,star:GameStar){
        let addr = signer::address_of(to);
        assert!(!exists<GameStar>(addr),STAR_EXIST);
        move_to<GameStar>(to,star);
        let num:u64 = 322;
        debug::print<u64>(&num)
        
    }
    public fun getItem(owner:address):(vector<u8>,u8)acquires GameStar{
        let star = borrow_global<GameStar>(owner);
        (star.name,star.value)

    }
    public fun setItemValue(owner:address,price:u8) acquires GameStar{
        assert!(exists<GameStar>(owner),STAR_NOT_EXIST);
        let star = borrow_global_mut<GameStar>(owner);
        star.value = star.value + price;
    }
    public fun transfer(owner:&signer,to:&signer) acquires GameStar{
        let addrTo = signer::address_of(to);
        assert!(!exists<GameStar>(addrTo),STAR_NOT_EXIST);

        let addrOwn = signer::address_of(owner);
        let star = move_from<GameStar>(addrOwn);
        star.value = star.value + 2;
        assert!(!exists<GameStar>(addrTo),STAR_EXIST);
        move_to<GameStar>(to,star);

    }

     public entry fun createStarBy(name:vector<u8>,country:vector<u8>,position:u8){
              
        
    }

   public entry fun test_game_entry(owner:signer,to:signer) acquires GameStar{
        let star = MyAddr::Game::createStar(b"Narmadha",b"Bharath",9);
        
        MyAddr::Game::mint(&owner,star);
        let addrOwn = signer::address_of(&owner);

        let (name,val) = MyAddr::Game::getItem(addrOwn);
        debug::print(&addrOwn);
        debug::print(&name);
        debug::print(&val);

        MyAddr::Game::setItemValue(addrOwn,3);
        let (name1,val1) = MyAddr::Game::getItem(addrOwn);

        debug::print(&addrOwn);
        debug::print(&name1);
        debug::print(&val1);

        // let addrFrom = signer::address_of(owner);
        // let addrTo = signer::address_of(to);
        MyAddr::Game::transfer(&owner,&to);

            }


    // #[test(owner=@0x42,to = @0x41)]
    // public entry fun test_game(owner:signer,to:signer) acquires GameStar{
    //     let star = MyAddr::Game::createStar(b"Narmadha",b"Bharath",9);
        
    //     MyAddr::Game::mint(&owner,star);
    //     let addrOwn = signer::address_of(&owner);

    //     let (name,val) = MyAddr::Game::getItem(addrOwn);
    //     debug::print(&addrOwn);
    //     debug::print(&name);
    //     debug::print(&val);

    //     MyAddr::Game::setItemValue(addrOwn,3);
    //     let (name1,val1) = MyAddr::Game::getItem(addrOwn);

    //     debug::print(&addrOwn);
    //     debug::print(&name1);
    //     debug::print(&val1);

    //     // let addrFrom = signer::address_of(owner);
    //     // let addrTo = signer::address_of(to);
    //     MyAddr::Game::transfer(&owner,&to);

        




    // }

}