ruby-server:
		. ./.makeconfig && \
        cd $${APP_CODE} && \
        bundle install && \
        rails server