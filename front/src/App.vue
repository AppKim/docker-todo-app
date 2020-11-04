<template>
  <div id="app">
    <TodoHeader></TodoHeader>
    <TodoInput v-on:childAddTodo="addTodo"></TodoInput>
    <TodoList
      v-bind:propsdata="todoItems"
      v-on:childRemoveTodo="removeTodo"
      v-on:childToggleComplete="toggleComplete"
    ></TodoList>
    <TodoFooter v-on:childClearAllTodo="clearAllTodo"></TodoFooter>
  </div>
</template>

<script>
import TodoHeader from "./components/TodoHeader";
import TodoInput from "./components/TodoInput";
import TodoList from "./components/TodoList";
import TodoFooter from "./components/TodoFooter";

import axios from "axios";
import qs from "qs";

const url = "http://localhost:3000/api/tasks";


export default {

  data: function() {
    return {
      todoItems: [],
    };
  },
  created() {
    this.loadList();
  },
  methods: {
    loadList: function() {
      axios.get(url).then(
        (response) => {
          console.log(response.data.tasks);
          for (var i = 0; i < response.data.tasks.length; i++) {
            this.todoItems.push(response.data.tasks[i]);
          }
        },
        (error) => {
          console.log(error);
        }
      );
    },
    addTodo: function(todoItem, isDone) {
      const params = {
        task: {
          name: todoItem,
          is_done: isDone,
        },
      };
      axios.post(url, qs.stringify(params)).then(
        (response) => {
          console.log(response.data);
          this.todoItems.push(response.data.task);
        },
        (error) => {
          console.log(error);
        }
      );
    },
    removeTodo: function(todoItem,index) {
      axios.delete(url + "/" + todoItem.id).then(
        (response) => {
          console.log(response.data);
          this.todoItems.splice(index,1);
        },
        (error) => {
          console.log(error);
        }
      );
    },
    toggleComplete: function(todoItem) {
      const params = {
        task: {
          is_done: !todoItem.is_done,
        },
      };      
      axios.patch(url + "/" + todoItem.id,qs.stringify(params)).then(
        (response) => {
          console.log(response.data);
        },
        (error) => {
          console.log(error);
        }
      )
    },
    clearAllTodo: function() {
      axios.delete(url).then(
        (response) => {
          console.log(response.data);
          this.todoItems.splice(0);
        },
        (error) => {
          console.log(error);
        }
      )
    },
  },
  components: {
    TodoHeader: TodoHeader,
    TodoInput: TodoInput,
    TodoList: TodoList,
    TodoFooter: TodoFooter,
  },
};
</script>

<style>
body {
  text-align: center;
  background-color: #f6f6f6;
}

input {
  border-style: groove;
}

button {
  border-style: groove;
}

.shadow {
  box-shadow: 5px 10px 10px rgba(0, 0, 0, 0.03);
}
</style>
