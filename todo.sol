// SPDX-License-Identifier: GPL-3.0 
pragma solidity >=0.8.0 <0.9.0;  
contract ToDo{
    struct Task{
        string task;
        bool done;
    }

    mapping (address => Task[]) private Users;

    // function to add tasks
    function addTask (string calldata _task) external { 
        Users[msg.sender].push(Task({
            task: _task,
            done: false
        }));
    }

    // this function reads the value in the task
    function getTask (uint _taskIndex) external view returns (Task memory){ 
        Task storage task = Users[msg.sender][_taskIndex];
        return task;
    }

    // this functions is updating the status of the task
    function updateStatus (uint256 _taskIndex, bool _status) external { 
        Users[msg.sender][_taskIndex].done = _status;
    }

    // this function will delete the task from list
    function deleteTask(uint256 _taskIndex) external{ 
       delete Users[msg.sender][_taskIndex];
   }

   function getTaskCount() external  view returns (uint256){
        return Users[msg.sender].length;
   }

}
