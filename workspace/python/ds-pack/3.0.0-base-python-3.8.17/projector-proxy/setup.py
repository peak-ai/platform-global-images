import setuptools

setuptools.setup(
    name="jupyter-projector-server",
    version="1.0",
    packages=setuptools.find_packages(),
    keywords=["Jupyter"],
    classifiers=["Framework :: Jupyter"],
    install_requires=["jupyter-server-proxy"],
    entry_points={
        "jupyter_serverproxy_servers": [
            "projector = jupyter_projector_proxy:setup_projector",
        ]
    },
    package_data={"jupyter_projector_proxy": ["icons/*"]},
)
