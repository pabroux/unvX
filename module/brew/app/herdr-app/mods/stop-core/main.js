// Stops herdr-core and quits the app (the old `prefix+q` → `herdr server stop`).
// Only a key press or click acts, so loading the mod is harmless.
// Enter confirms, Esc cancels.

import { View, div } from "gpui-kit";
import { v_flex, h_flex } from "gpui-base";
import { exec, run, props, closeOverlay, notify, theme } from "herdr";

export default class StopCore extends View {
  init(_props, cx) {
    this.handle = cx.focus_handle();
    this.handle.focus();
  }

  stop(cx) {
    closeOverlay(props().overlay);
    cx.spawn(async () => {
      try {
        await exec("hc", ["server", "stop"]);
        run("app.quit");
      } catch (e) {
        notify({ title: "Couldn't stop herdr-core", body: String(e), level: "error" });
      }
    });
  }

  render(cx) {
    const t = theme();
    const button = (id, label, bg, fg, onClick) =>
      h_flex().id(id).h(32).px(14).items_center().rounded(8).border_1().border_color(id === "no" ? t.input : bg).bg(bg).text_color(fg).cursor_pointer().hover((s) => s.opacity(0.88)).on_click(onClick).child(label);
    return v_flex()
      .id("stop-core")
      .track_focus(this.handle)
      .on_key_down((e, cx) => {
        if (e.key === "enter") this.stop(cx);
        else if (e.key === "escape") closeOverlay(props().overlay);
        else return;
        cx.stop_propagation();
      })
      .size_full()
      .min_h(0)
      .p(18)
      .gap(12)
      .bg(t.popover)
      .text_size(13)
      .child(div().text_size(15).font_semibold().text_color(t.foreground).child("Stop herdr-core and quit?"))
      .child(div().flex_1().min_h(0).text_color(t.muted).child("Every running terminal and agent ends. Each one comes back as a shell the next time the core starts."))
      .child(
        h_flex()
          .justify_end()
          .gap(8)
          .text_size(12)
          .child(button("no", "Cancel", t.raised, t.foreground, () => closeOverlay(props().overlay)))
          .child(button("yes", "Stop and quit", t.solid, t.solid_foreground, (_e, cx) => this.stop(cx))),
      );
  }
}
