pragma solidity >=0.4.22 <0.9.0;

contract TodoList {
    uint public taskCount = 0;

    struct Task {
        uint id;
        string taskString;
        bool completed;
    }

    mapping(uint => Task) public tasks;

    constructor() public {
        createTask("Default Task");
    }

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
    }

}



