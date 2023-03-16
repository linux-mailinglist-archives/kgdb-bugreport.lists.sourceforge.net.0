Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 005016BDA21
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Mar 2023 21:27:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pcuBs-0001w1-LZ
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 16 Mar 2023 20:27:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pcuBr-0001vv-5c
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 16 Mar 2023 20:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g57LqyNVPd4QtvwDpadq5p0zhAPNVIWZbBGClF8fQN4=; b=lxG2IuoqwzF/7j4VC7NAtqZ/qM
 KrIp2/qWCMeuSRaOpF+VGLQOVKeq7uj5jLT22rdfHFE7kSz8NAHT+t/vG/lAviiFdrLyQ30FfcSkq
 gFR1lBa5wVwue33xRUEwW8qchferTb5L+gFmke8GdsZXaYHMujGZrbyg1wanzNHc43BU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g57LqyNVPd4QtvwDpadq5p0zhAPNVIWZbBGClF8fQN4=; b=PL9RZz4TvMqxCdW1jYqUayqoaj
 +9LwAAXEgzQEfx9jJRSHQyxO95jr3JAzt5r19rPUKMZmpeHYUPPNHeNn6ncAc3MxdO5R56LlSgE9V
 uJobn+Jrb+iYRbIm+HR4CoYt5n7WEu5azFPGnQNcgo9qsTzOmYVyriT4GcFOYciSDfKI=;
Received: from mail-qt1-f173.google.com ([209.85.160.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pcuBo-00007h-91 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 16 Mar 2023 20:27:12 +0000
Received: by mail-qt1-f173.google.com with SMTP id h19so3224039qtn.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Mar 2023 13:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678998422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g57LqyNVPd4QtvwDpadq5p0zhAPNVIWZbBGClF8fQN4=;
 b=ktx4n+J79z0MdVE5zTVU0XAxqEzIJEkoAR6TFA1HTyndyOuu3DQBETtHCoVvehZogH
 RtVpEyQTGtvQ7q6gfV1+Io2eLm0fdwEQQBGwo/nDcMHmCSMGrJngtV4LUIYzZOeG9SB2
 l7JwB7tDWYWUrKosOved3plgLlv8B+n17FGVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678998422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g57LqyNVPd4QtvwDpadq5p0zhAPNVIWZbBGClF8fQN4=;
 b=yM+iefy2bPjxgEgIn96GTh2pGgu7dmAdpYWkPPMF7mZpHRLQSuVwKcfq7OzBMXR8s1
 b0TjyyQeG36dgeinr3gba7gkw64G5fMKOdcAcXR6KO4rIeE9KtsNq8pzgXRcY+xak8nv
 2eYJg7DDtw8pLTN8+/IRocqqAiLx6isqkRzjQyoHsU8mbqtzTst6lBzfSA7qsPjKTzis
 52qe0tqDzdU7jTuwjHvVP9NYi/WUf3ZYxCB95/EWbLnpqmoQZfPWVzQTiCjn/KhhRGgf
 RiBSyxXlPVK/adhMdpjsF/RBhuUmO60D7pLXDlJlW5D0TOBGg0RN/0vmPXBDdgUm13B7
 5vTQ==
X-Gm-Message-State: AO0yUKV4OrDKUIygHBa2Mc/+/W1Aq9ZpwuTwzP2X06U1ZWkbY2keDQcR
 VGUloNFZs5bZwYlog4KB5BX+yosuAcn6e/IHNxI=
X-Google-Smtp-Source: AK7set9yCaDngXDzLHihTbNxF3zv4vAS5iqalhbZOQqV0PyRM1ANGSN9XbnsR7tHimYz7WJ9Kc71Dw==
X-Received: by 2002:a17:90a:1903:b0:233:76bd:9faa with SMTP id
 3-20020a17090a190300b0023376bd9faamr5352705pjg.47.1678998080936; 
 Thu, 16 Mar 2023 13:21:20 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4db6:6f23:6ad2:998d])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a17090a5a0400b0023acdac248dsm24114pjd.15.2023.03.16.13.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 13:21:20 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 16 Mar 2023 13:20:56 -0700
Message-Id: <20230316132027.RESEND.1.I106c39498d8094c6f5e7ada42c7db17aa5c64e48@changeid>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230316202057.4070382-1-dianders@chromium.org>
References: <20230316202057.4070382-1-dianders@chromium.org>
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
 no trust [209.85.160.173 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.173 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pcuBo-00007h-91
Subject: [Kgdb-bugreport] [RESEND PATCH 1/2] serial: uart_poll_init() should
 power on the UART
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
2.40.0.rc1.284.g88254d51c5-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
