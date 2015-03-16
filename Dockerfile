FROM skopciewski/arch_ruby:2.2-dev

ENV BUNDLE_WITHOUT=""

# install project
WORKDIR /opt/project/code
COPY . /opt/project/code

RUN bundle install

CMD bash
