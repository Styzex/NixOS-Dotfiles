const time = Variable('', {
    poll: [1000, function() {
        return Date().toString()
    }],
})

const Bar = (/** @type {number} */ monitor) => Widget.Window({
    monitor: 0,
    name: `bar1`,
    anchor: ['top', 'left', 'right'],
    exclusivity: 'exclusive',
    child: Widget.CenterBox({
        }),
        end_widget: Widget.Label({
            hpack: 'center',
            label: time.bind(),
        }),
    }),
})

App.config({
    windows: [Bar],
})
