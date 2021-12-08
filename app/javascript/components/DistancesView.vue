<template>
  <div class="my-4">
    <h2>
      Первоначальный массив
    </h2>
    <h4 class="alert alert-primary" id="initial">
      {{initial}}
    </h4>
    <div v-if="distances && distances.length !== 0" class="d-flex flex-column">
      <h2>
        Все отрезки
      </h2>
      <h4 v-for="(distance, i) in distances" class="alert alert-primary" :id="`distance-${i}`">
        {{distance}}
      </h4>
      <h2>
        Самый длинный отрезок
      </h2>
      <h4 class="alert alert-primary" id="maxDistance">
        {{maxDistance}}
      </h4>
    </div>
    <h4 v-else class="alert alert-warning" id="error">
      Отрезков из чисел, являющихся степенями 5, не найдено
    </h4>
  </div>

</template>

<script>
export default {
  name: "DistancesView",
  props: ["distances", "maxDistance", "initial"],
}
</script>

<style scoped>

</style>