Esta es una solucion provista por el usuario elisma del discord de solidity-latam




struct Person {
    uint _weight;
    uint _weightAfter;
}

mapping(address => Person) public people;

function addPerson(uint _weight) public {
    people[msg.sender] = Person(_weight, 0);
}

function theWeighing(uint _weightAfter) public {
    people[msg.sender]._weightAfter = _weightAfter;
}

function getContestantweightLoss() public view returns(uint) {
    return people[msg.sender]._weightAfter - people[msg.sender]._weight;
}