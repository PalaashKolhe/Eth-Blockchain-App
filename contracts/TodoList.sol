pragma solidity >=0.4.22 <0.9.0;

contract TodoList {
    uint256 public taskCount = 0;

    struct Task {
        uint256 id;
        string taskString;
        bool completed;
    }

    mapping(uint256 => Task) public tasks;

    event TaskCreated(uint256 id, string content, bool completed);

    event TaskToggled(uint id, bool completed);

    constructor() public {
        createTask("Default Task");
    }

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskToggled(_id, _task.completed);
    }
}
