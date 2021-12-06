<template>
  <form v-on:submit="onSubmit">
    <div class="mb-3">
      <label for="arr-input" class="form-label">Введите числа через пробел</label>
      <input id="arr-input" type="text" class="form-control" v-model="arr" name="arr">
    </div>
    <button type="submit" class="btn btn-primary">
      Получить результат
    </button>
  </form>
</template>

<script>
export default {
  name: "MainForm",
  props: ['onFormSubmit'],
  data: () => {
    return {
      arr: ''
    }
  },
  methods: {
    onSubmit(e) {
      e.preventDefault();
      this.onFormSubmit(this.arr);
    }
  }
}
</script>

<style scoped>
</style>