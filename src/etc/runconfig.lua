return {
    -- 集群
    cluster = {
        db = '127.0.0.1:7786',
        node0 = '127.0.0.1:7787',
        node1 = '127.0.0.1:7788',
        node2 = '127.0.0.1:7789'
    },
    -- scene
    scene = {
        node1 = {3001,3002}
        -- node2 = {4003},
    },
    -- db
    db = {
        host = "127.0.0.1",
        port = 27017,
        username = 'yhx',
        password = 'qwer.123.',
        authdb = 'admin',
        db = 'test',
    },
    -- 节点1
    node1 = {
        -- 8000_8299
        gateway = {
            [1] = {port = 8000},
            [2] = {port = 8001},
            [3] = {port = 8002},
            [4] = {port = 8003}
        },
        login = {
            [1] = {},
            [2] = {}
        },
        agentmgr = {
            [1] = {},
            [2] = {}
        },
    },
    -- 节点2
    node2 = {
        -- 9000_9299
        gateway = {
            [1] = {port = 9000},
            [2] = {port = 9001}
        },
        login = {
            [1] = {},
            [2] = {}
        },
        agentmgr = {
            [1] = {},
            [2] = {}
        },
    }
}
