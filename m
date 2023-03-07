Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E646AE5BF
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  7 Mar 2023 17:02:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pZZlr-0005At-Od
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 07 Mar 2023 16:02:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pZZlq-0005Ag-Hk
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 07 Mar 2023 16:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ON/hRDAPf2AptDjynSCH9JnA/LFyPWk7i2ryXctmn+Y=; b=KPpMEnyqhSiFc811dMYjviuuUP
 JdScs3+mqdJPevL5OfG2ChrwKnwr4BiUTojFxHve2+Cn50SNIvwfCOO0j3NRar+aaCnRWCAmkrtXg
 8XsTpyOPLfCvufSzyz1TWe9FNZwMK6MeD80wQAy0ezwsdAwJ8q4n8wDawOWUX8fAJKHk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ON/hRDAPf2AptDjynSCH9JnA/LFyPWk7i2ryXctmn+Y=; b=KyteMVv1p66sdJhkkrIC0rg0KN
 Ha/jqK+x7znbM2AFay8ZSelUXrP7Ep9pNE6v4GdfSEprz+x3SjRU7XQAzYML8ymNiDysmdVgWSObe
 +pm8ELni3RRwfEyXbCIsOAXCdyL7YWh6uRQF6dZ4FjFMlAaHG7+lOPdiHe8hYdNZwwME=;
Received: from mail-yw1-f175.google.com ([209.85.128.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pZZlm-002Kmk-O4 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 07 Mar 2023 16:02:32 +0000
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-536c2a1cc07so252621337b3.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 07 Mar 2023 08:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678204945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ON/hRDAPf2AptDjynSCH9JnA/LFyPWk7i2ryXctmn+Y=;
 b=mrCIOU/+E9b3zs6Ljsu+99Gjhr6jgWwWq6MCqQ8Tz/jLaAmRgPeYQUymiq4+YioSWC
 Ilb8+hdqS+S+COVooh9RpTv8Zi+VVHIYl4iqm9vOyaA+ikIg6GS/GH+wNUKZqPfl0uQ5
 v5eXLpyOxPlNtPuWPZ6oCpUVobUwjPDu6sLFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678204945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ON/hRDAPf2AptDjynSCH9JnA/LFyPWk7i2ryXctmn+Y=;
 b=O3cymRNT5/1gVZivZVYdScs5dEDhzUZaUaTEjIIsMxR9SPJQ9aeJuPr3PU3NKYTGyf
 56ii6wnSLdwwhin3pYvVnG41drfCtiRoMkt+/ktwnJ1J1PCTEliv5eK4bMxSkdllBOmG
 sXhTQUMerOyox/zB76qCckIzy4LF1TNAsEwmiOMc4bJrsQSYR6Vh9UcjHTJ8tbyajsFI
 Ji7EGq8c3H0YGgWdStHwlS3tT7WGMTeTyZ7LfpYYyZL/9B1WEuaCFUnSrU2NsLDqPe4i
 7eEyqttikcoacZBYAUJt4qf+NTgagTmDsDUR0C0ON42z7iApgBDscw4rO3Yvw0spN7j8
 l91A==
X-Gm-Message-State: AO0yUKW3gJWPrbN0WpqrMYRVlfXmf4z3cQm+QaEZ4mhHfQ5AepFZCgnm
 rZjYrygjC6wiDoL+W9DKmzGRxE1XOdtyIzxTjnU=
X-Google-Smtp-Source: AK7set8Pq0zKle5kvg0bl99RxErDbClwVzYTLcHrnnZKDUGJ1OcT5eP48PVWzvKPbEVb5LoqnGRxAA==
X-Received: by 2002:a17:902:7798:b0:19c:bcb1:d8c3 with SMTP id
 o24-20020a170902779800b0019cbcb1d8c3mr12668737pll.54.1678203169556; 
 Tue, 07 Mar 2023 07:32:49 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:2023:7dda:98bb:96dd])
 by smtp.gmail.com with ESMTPSA id
 jy16-20020a17090342d000b0019719f752c5sm8586843plb.59.2023.03.07.07.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 07:32:49 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue,  7 Mar 2023 07:32:12 -0800
Message-Id: <20230307073155.2.I106c39498d8094c6f5e7ada42c7db17aa5c64e48@changeid>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
In-Reply-To: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
References: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Qualcomm devices which use the "geni" serial driver,
 kdb/kgdb
 won't be very happy if you use it but the resources of the port haven't been
 powered on. Today kdb/kgdb rely on someone else powering t [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.175 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.175 listed in wl.mailspike.net]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pZZlm-002Kmk-O4
Subject: [Kgdb-bugreport] [PATCH 2/3] serial: uart_poll_init() should power
 on the UART
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-serial@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Qualcomm devices which use the "geni" serial driver, kdb/kgdb won't
be very happy if you use it but the resources of the port haven't been
powered on. Today kdb/kgdb rely on someone else powering the port
on. This could be the normal kernel console or an agetty running.
Let's fix this to explicitly power things on when setting up a polling
driver.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/serial_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 2bd32c8ece39..b14b5ed6fff4 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -2593,6 +2593,7 @@ static int uart_poll_init(struct tty_driver *driver, int line, char *options)
 {
 	struct uart_driver *drv = driver->driver_state;
 	struct uart_state *state = drv->state + line;
+	enum uart_pm_state pm_state;
 	struct tty_port *tport;
 	struct uart_port *port;
 	int baud = 9600;
@@ -2610,6 +2611,9 @@ static int uart_poll_init(struct tty_driver *driver, int line, char *options)
 		goto out;
 	}
 
+	pm_state = state->pm_state;
+	uart_change_pm(state, UART_PM_STATE_ON);
+
 	if (port->ops->poll_init) {
 		/*
 		 * We don't set initialized as we only initialized the hw,
@@ -2626,6 +2630,8 @@ static int uart_poll_init(struct tty_driver *driver, int line, char *options)
 		console_list_unlock();
 	}
 out:
+	if (ret)
+		uart_change_pm(state, pm_state);
 	mutex_unlock(&tport->mutex);
 	return ret;
 }
-- 
2.40.0.rc0.216.gc4246ad0f0-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
