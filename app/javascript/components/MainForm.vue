<template>
  <form v-on:submit="onSubmit">
    <div class="mb-3">
      <label for="n-input" class="form-label">Количество элементов</label>
      <input id="n-input" type="number" min="0" max="15" class="form-control" v-model="nInput" name="n">
    </div>
    <div class="mb-3 row justify-content-center" v-if="isValid">
      <span class="form-label" v-if="">Элементы</span>
      <input
          type="number"
          v-for="(_, index) in arr"
          class="form-control item-input m-1"
          v-model="arr[index]"
          min="0"
      >
    </div>
    <div class="d-flex justify-content-end" v-if="isValid">
      <button type="submit" class="btn btn-primary">
        Получить результат
      </button>

    </div>
  </form>
</template>

<script>
export default {
  name: "MainForm",
  props: ['onFormSubmit'],
  data: () => {
    return {
      n: 0,
      arr: []
    }
  },
  methods: {
    onSubmit(e) {
      e.preventDefault();
      const data = {...this.$data};
      data.arr = data.arr.map(el => parseInt(el));
      this.onFormSubmit(data);
    }
  },
  watch: {
    n: function (val) {
      this.arr = Array(val).fill(0);
    }
  },
  computed: {
    isValid() {
      return this.n !== 0;
    },
    nInput: {
      get: function() {
        return this.n.toString();
      },
      set: function (val) {
        this.n = parseInt(val)
      }
    }
  }
}
</script>

<style scoped>
.item-input {
  max-width: 200px;
}
</style>