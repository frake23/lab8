<template>
  <div class="my-4">
    <h2>
      Количество: {{initial.n}}
    </h2>
    <h2>
      Первоначальный массив: {{initial.arr.join(' ')}}
    </h2>
    <div v-if="distances && distances.length !== 0" class="d-flex flex-column">
      <h2>
        Все отрезки
      </h2>
      <h4 v-for="distance in allDistances">
        {{distance}}
      </h4>
      <h2 class="mt-3">
        Самый длинный отрезок
      </h2>
      <h4>
        {{maxDistanceStr}}
      </h4>
    </div>
    <h2 v-else>
      Отрезков из чисел, являющихся степенями 5, не найдено
    </h2>
  </div>

</template>

<script>
export default {
  name: "DistancesView",
  props: ["distances", "maxDistance", "initial"],
  computed: {
    allDistances() {
      return this.distances.map(dis => dis.join(' '));
    },
    maxDistanceStr() {
      return this.maxDistance.join(' ')
    }
  }
}
</script>

<style scoped>

</style>