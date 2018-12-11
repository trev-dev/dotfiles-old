from libqtile.config import Group

group_settings = [
    (
        "1",
        {
            "label": "",
            "layout": "monadwide",
        }
    ),
    (
        "2",
        {
            "label": "",
            "layout": "max"
        }
    ),
    (
        "3",
        {
            "label": "",
            "layout": "max"
        }
    ),
    (
        "4",
        {
            "label": "",
            "layout": "max"
        }
    ),
    (
        "7",
        {
            "label": "",
            "layout": "max"
        }
    ),
    (
        "8",
        {
            "label": "",
            "layout": "max"
        }
    ),
    (
        "9",
        {
            "label": "",
            "layout": "max"
        }
    ),
    (
        "0",
        {
            "label": "♬",
            "layout": "max"
        }
    )
]

exports = [Group(name, **kwargs) for name, kwargs in group_settings]
