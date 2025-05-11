// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaskBoard {

    // Struct to store task details
    struct Task {
        string name;
        string description;
        bool isCompleted;
    }

    // Mapping to store tasks by task ID
    mapping(uint => Task) public tasks;

    // Array to store all task IDs
    uint[] public taskIds;

    // Event to notify when a task is added
    event TaskAdded(uint taskId, string name, string description);

    // Event to notify when a task is updated
    event TaskUpdated(uint taskId, string name, string description, bool isCompleted);

    // Event to notify when a task is deleted
    event TaskDeleted(uint taskId);

    // Function to add a new task
    function addTask(string memory _name, string memory _description) public {
        uint taskId = taskIds.length;
        tasks[taskId] = Task({
            name: _name,
            description: _description,
            isCompleted: false
        });
        taskIds.push(taskId);
        emit TaskAdded(taskId, _name, _description);
    }

    // Function to update a task
    function updateTask(uint _taskId, string memory _name, string memory _description, bool _isCompleted) public {
        require(_taskId < taskIds.length, "Task does not exist");
        
        Task storage task = tasks[_taskId];
        task.name = _name;
        task.description = _description;
        task.isCompleted = _isCompleted;

        emit TaskUpdated(_taskId, _name, _description, _isCompleted);
    }

    // Function to delete a task
    function deleteTask(uint _taskId) public {
        require(_taskId < taskIds.length, "Task does not exist");

        // Deleting the task by removing it from the mapping
        delete tasks[_taskId];

        // Removing task from the array by shifting elements
        for (uint i = _taskId; i < taskIds.length - 1; i++) {
            taskIds[i] = taskIds[i + 1];
        }

        // Remove the last element (which was shifted)
        taskIds.pop();

        emit TaskDeleted(_taskId);
    }

    // Function to get task details
    function getTask(uint _taskId) public view returns (string memory, string memory, bool) {
        require(_taskId < taskIds.length, "Task does not exist");
        Task memory task = tasks[_taskId];
        return (task.name, task.description, task.isCompleted);
    }

    // Function to get all task IDs
    function getAllTaskIds() public view returns (uint[] memory) {
        return taskIds;
    }
}
