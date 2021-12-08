<template>
  <div>
    <div class="row justify-content-around">
      <h4 class="col-5 border border-danger p-2 rounded">
        Входные данные
      </h4>
      <h4 class="col-5 border border-danger p-2 rounded">
        Результат
      </h4>
    </div>

    <div v-for="result in results" class="row justify-content-around">
      <h4 class="col-5 border border-primary p-2 rounded">
        {{result['input']}}
      </h4>
      <h4 class="col-5 border border-primary p-2 rounded">
        {{result['max_distance']}}
      </h4>
    </div>
  </div>

</template>

<script>
export default {
  name: "HistoryView",
  props: ["results"]
}
</script>

<style scoped>

</style>