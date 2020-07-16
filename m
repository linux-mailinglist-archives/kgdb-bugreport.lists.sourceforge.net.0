Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6D3222136
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Jul 2020 13:17:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jw1sr-0003MM-5u
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Jul 2020 11:17:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <keescook@chromium.org>) id 1jvuGb-0005Ce-HA
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 03:09:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8vJxKwUVpAhdj4wYAl5b2tdLtDhCjBtUhiOv5fUux8k=; b=ii9OWRkdIGl8TQ7J4rce8e8XCH
 i0XCJVqH20vlB61Xu+uKGDcQMRJAyD61+lrSCjXvnbZ6BBtZH0kpfA/EqJCs3j9xBGyV3qKCKog2p
 bF+9kWMCWJHn1WM0grRxETfAndPcfx1fWk++IQem3JdyyS/6VF/LF6v046Q1sAykJdkw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8vJxKwUVpAhdj4wYAl5b2tdLtDhCjBtUhiOv5fUux8k=; b=aLjLxc4OSLebUNdKwuyY3wJhmm
 UH4nRf57TXFxToQ1o4dJEfGE3fdOsixoF3FMxP9UOXYKpbmSpXp49TZVvKGXvY51iocK0LEt6lOFh
 HNyq9uP+hY273i7N7zUfTiZFtOwLG+ZXLdsa2xsBEG+im7R2XGWmsBSb4NENCw2vFvGw=;
Received: from mail-pl1-f193.google.com ([209.85.214.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jvuGZ-002ESL-JR
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 03:09:01 +0000
Received: by mail-pl1-f193.google.com with SMTP id p1so3254302pls.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 15 Jul 2020 20:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8vJxKwUVpAhdj4wYAl5b2tdLtDhCjBtUhiOv5fUux8k=;
 b=dTugxUNjGm8SBhEVwZ0yB8FvtZrzhFOHuSpiIvNE2E3SjUjSrIE1w14I52dw3Uk8b5
 3VAafc7gUmjsQ/YS7Xjq8i7OhMMWVeWrbTF8mKhc0S9n4IAuIzChi1+9oaZlREtdDKow
 3jCsslDzAr0zlil4XVqBtq+3neBsSD18zU00A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8vJxKwUVpAhdj4wYAl5b2tdLtDhCjBtUhiOv5fUux8k=;
 b=pv4b56X5AoVXrAItAUBDcbF0/it+TEsblKqheEOl5MCfHPmlILIG8CoDp01+bQU6YK
 fu0ABwzoFtEo8Marts3TGo6k/EguU0XgOaARCh4Ornz4rYcDrTrdB1ao9GHT0WbqXkkk
 PBwDlUSOAy8hYfNYdi9JZpM6POG7+YMwdMu8hLkUOMif+GUn2NzZ8XpmMalFU7nFNRjm
 nrXKoZdGSMWg2KEl+2UqLM2Kl39URhRi5a7IqRUzegLnBoiwqE335zUr4JFUJ6RI1txU
 sLDahrHN9Jd4q5jBpdAQfXWz5QfWKAU+MLwZ2jkr5l0JUHl0BcyXXQc1TFWqW3i0Q6JE
 a2hw==
X-Gm-Message-State: AOAM530ufpMeC7eUzdBWvSLFPipjOeK2rKyZYA6bTpcMkpgTCvo5dbQw
 L3VKTcWsBL3NwyYKToqxhKVn1w==
X-Google-Smtp-Source: ABdhPJxTrfzJCqi7BCSMsLwnF0LnH2/m3v4TdrKv4bsn5z85zApyPj+eDhaQfjttTIQn/Q1hTEyF2g==
X-Received: by 2002:a17:902:6181:: with SMTP id
 u1mr1929746plj.205.1594868934031; 
 Wed, 15 Jul 2020 20:08:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 19sm3209358pfy.193.2020.07.15.20.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 20:08:52 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 15 Jul 2020 20:08:47 -0700
Message-Id: <20200716030847.1564131-4-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716030847.1564131-1-keescook@chromium.org>
References: <20200716030847.1564131-1-keescook@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvuGZ-002ESL-JR
X-Mailman-Approved-At: Thu, 16 Jul 2020 11:16:59 +0000
Subject: [Kgdb-bugreport] [PATCH 3/3] tasklet: Introduce new initialization
 API
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
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Oscar Carter <oscar.carter@gmx.com>, Mitchell Blank Jr <mitch@sfgoth.com>,
 kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, alsa-devel@alsa-project.org,
 Allen Pais <allen.lkml@gmail.com>,
 Christian Gromm <christian.gromm@microchip.com>, Will Deacon <will@kernel.org>,
 devel@driverdev.osuosl.org, Jonathan Corbet <corbet@lwn.net>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Julian Wiedmann <jwi@linux.ibm.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Wambui Karuga <wambui.karugax@gmail.com>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-input@vger.kernel.org, Ursula Braun <ubraun@linux.ibm.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Felipe Balbi <balbi@kernel.org>, Kyungtae Kim <kt0755@gmail.com>,
 netdev@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Kevin Curtis <kevin.curtis@farsite.co.uk>, linux-usb@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Romain Perier <romain.perier@gmail.com>, Karsten Graul <kgraul@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Romain Perier <romain.perier@gmail.com>

Nowadays, modern kernel subsystems that use callbacks pass the data
structure associated with a given callback as argument to the callback.
The tasklet subsystem remains one which passes an arbitrary unsigned
long to the callback function. This has several problems:

- This keeps an extra field for storing the argument in each tasklet
  data structure, it bloats the tasklet_struct structure with a redundant
  .data field

- No type checking can be performed on this argument. Instead of
  using container_of() like other callback subsystems, it forces callbacks
  to do explicit type cast of the unsigned long argument into the required
  object type.

- Buffer overflows can overwrite the .func and the .data field, so
  an attacker can easily overwrite the function and its first argument
  to whatever it wants.

Add a new tasklet initialization API, via DECLARE_TASKLET() and
tasklet_setup(), which will replace the existing ones.

This work is greatly inspired by the timer_struct conversion series,
see commit e99e88a9d2b0 ("treewide: setup_timer() -> timer_setup()")

To avoid problems with both -Wcast-function-type (which is enabled in
the kernel via -Wextra is several subsystems), and with mismatched
function prototypes when build with Control Flow Integrity enabled,
this adds the "use_callback" member to let the tasklet caller choose
which union member to call through. Once all old API uses are removed,
this and the .data member will be removed as well. (On 64-bit this does
not grow the struct size as the new member fills the hole after atomic_t,
which is also "int" sized.)

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Co-developed-by: Allen Pais <allen.lkml@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Co-developed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/interrupt.h | 24 +++++++++++++++++++++++-
 kernel/softirq.c          | 18 +++++++++++++++++-
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index b911196f03eb..15570b237e53 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -608,10 +608,30 @@ struct tasklet_struct
 	struct tasklet_struct *next;
 	unsigned long state;
 	atomic_t count;
-	void (*func)(unsigned long);
+	bool use_callback;
+	union {
+		void (*func)(unsigned long data);
+		void (*callback)(struct tasklet_struct *t);
+	};
 	unsigned long data;
 };
 
+#define DECLARE_TASKLET(name, _callback)		\
+struct tasklet_struct name = {				\
+	.count = ATOMIC_INIT(0),			\
+	.callback = _callback,				\
+	.use_callback = true,				\
+}
+
+#define DECLARE_TASKLET_DISABLED(name, _callback)	\
+struct tasklet_struct name = {				\
+	.count = ATOMIC_INIT(1),			\
+	.callback = _callback,				\
+}
+
+#define from_tasklet(var, callback_tasklet, tasklet_fieldname)	\
+	container_of(callback_tasklet, typeof(*var), tasklet_fieldname)
+
 #define DECLARE_TASKLET_OLD(name, _func)		\
 struct tasklet_struct name = {				\
 	.count = ATOMIC_INIT(0),			\
@@ -691,6 +711,8 @@ extern void tasklet_kill(struct tasklet_struct *t);
 extern void tasklet_kill_immediate(struct tasklet_struct *t, unsigned int cpu);
 extern void tasklet_init(struct tasklet_struct *t,
 			 void (*func)(unsigned long), unsigned long data);
+extern void tasklet_setup(struct tasklet_struct *t,
+			  void (*callback)(struct tasklet_struct *));
 
 /*
  * Autoprobing for irqs:
diff --git a/kernel/softirq.c b/kernel/softirq.c
index c4201b7f42b1..292e7c2d2333 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -547,7 +547,10 @@ static void tasklet_action_common(struct softirq_action *a,
 				if (!test_and_clear_bit(TASKLET_STATE_SCHED,
 							&t->state))
 					BUG();
-				t->func(t->data);
+				if (t->use_callback)
+					t->callback(t);
+				else
+					t->func(t->data);
 				tasklet_unlock(t);
 				continue;
 			}
@@ -573,6 +576,18 @@ static __latent_entropy void tasklet_hi_action(struct softirq_action *a)
 	tasklet_action_common(a, this_cpu_ptr(&tasklet_hi_vec), HI_SOFTIRQ);
 }
 
+void tasklet_setup(struct tasklet_struct *t,
+		   void (*callback)(struct tasklet_struct *))
+{
+	t->next = NULL;
+	t->state = 0;
+	atomic_set(&t->count, 0);
+	t->callback = callback;
+	t->use_callback = true;
+	t->data = 0;
+}
+EXPORT_SYMBOL(tasklet_setup);
+
 void tasklet_init(struct tasklet_struct *t,
 		  void (*func)(unsigned long), unsigned long data)
 {
@@ -580,6 +595,7 @@ void tasklet_init(struct tasklet_struct *t,
 	t->state = 0;
 	atomic_set(&t->count, 0);
 	t->func = func;
+	t->use_callback = false;
 	t->data = data;
 }
 EXPORT_SYMBOL(tasklet_init);
-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
