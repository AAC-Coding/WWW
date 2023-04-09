import { ComputedRef, Ref } from 'vue'
export type LayoutKey = "custom-layout" | "default-layout"
declare module "/Users/adalkispena/Desktop/projects/WWW/node_modules/nuxt/dist/pages/runtime/composables" {
  interface PageMeta {
    layout?: false | LayoutKey | Ref<LayoutKey> | ComputedRef<LayoutKey>
  }
}