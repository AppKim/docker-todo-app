<template>
  <div class="inputBox shadow">
    <!-- To Way Binding -->
    <input type="text" v-model="newTodoItem" v-on:keyup.enter="addTodo" />
    <span class="addContainer" v-on:click="addTodo">
      <i class="fas fa-plus addBtn"></i>
    </span>
    <Modal v-if="isDone" @close="isDone = false">
      <!--
      you can use custom content here to overwrite
      default content
    -->

      <h3 slot="header">
        Warning!
        <i class="far fa-times-circle closeBtn" @click="isDone = false"></i>
      </h3>
      <h4 slot="body">please enter text.</h4>
      <span slot="footer"></span>
    </Modal>
  </div>
</template>

<script>
import Modal from "./common/Modal";

export default {
  data: function() {
    return {
      newTodoItem: "",
      isDone: false,
    };
  },
  methods: {
    addTodo: function() {
      if (this.newTodoItem !== "") {
        this.$emit("childAddTodo", this.newTodoItem, this.isDone);
        this.clearInput();
      } else {
        this.isDone = !this.isDone;
      }
    },
    clearInput: function() {
      this.newTodoItem = "";
    },
  },
  components: {
    Modal: Modal,
  },
};
</script>

<style scoped>
input:focus {
  outline: none;
}
.inputBox {
  background: white;
  height: 50px;
  line-height: 50px;
  border-radius: 5px;
}
.inputBox input {
  border-style: none;
  font-size: 0.9rem;
  width: 80%;
}
.inputBox span {
  width: 15%;
}
.addContainer {
  float: right;
  background: linear-gradient(to right, #6478fb, #8736fb);
  display: block;
  width: 3rem;
  border-radius: 0 5px 5px 0;
}
.addBtn {
  color: white;
  vertical-align: middle;
}
.closeBtn {
  color: #42b983;
  float: right;
  font-size: 25px;
}
</style>
