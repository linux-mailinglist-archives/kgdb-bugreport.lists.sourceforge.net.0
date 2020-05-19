Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 114D01D9BA7
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 19 May 2020 17:49:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jb4UI-0003rR-Ri
	for lists+kgdb-bugreport@lfdr.de; Tue, 19 May 2020 15:49:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jb4UH-0003rA-5c
 for kgdb-bugreport@lists.sourceforge.net; Tue, 19 May 2020 15:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=npj6nyuWQ54ZRzukHs7PaMjCvPNDE9Mt94DLOgYmdAM=; b=LPO1P8YRNd882EdppEU5ybRcKT
 N/y4nR9gdw0MmC+EauzlpComJIwtCsL4nSAgpwX/R2hm5DvUYUPW3x6Th50QNbbQDtaiJj7TZQyT3
 xIoyxCRHV415imetg38adGB6yh1DRVM6/0Mld2KopgCzQwKnArEBnucWB920jC8XZQ/Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=npj6nyuWQ54ZRzukHs7PaMjCvPNDE9Mt94DLOgYmdAM=; b=m
 H6taR7CqvGnLGQ7thRr2llRs2ImpuEXFVA93pFkYM828TPHKmnVrrnRDISONs3973hs2rqIFmQh83
 RDi00UWPO71BL7rJVWCajTqxIuT5ojycK/1ivjuD1vPjIRHNeTtbrfxZi2AA9klIJWvFW1Mh/glSs
 GeL6F2Ti3O/WHLQU=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jb4UE-007YyN-U2
 for kgdb-bugreport@lists.sourceforge.net; Tue, 19 May 2020 15:49:00 +0000
Received: by mail-pf1-f196.google.com with SMTP id z26so70765pfk.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 19 May 2020 08:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=npj6nyuWQ54ZRzukHs7PaMjCvPNDE9Mt94DLOgYmdAM=;
 b=P0+mae6a84cR5xUqIaEO+Q0bl2fCnvLeySFo+ugO3JyjssDIgkmsmpUbWGMOo30eLp
 4la4jakE5roQ8jjlKA1FzIi2twmGQr7jNmyR4G/fELC21PiyyV8enb6i9lBDEIrIB2rV
 AVTHOA5HszSMzkwJ81gPBz5iiLnARXbKwKDDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=npj6nyuWQ54ZRzukHs7PaMjCvPNDE9Mt94DLOgYmdAM=;
 b=HJfV5m9501EqcY0ZOh0olUp3BjS7Y92sNnGLT6FPb0VV8aTPNOqtrYdI5KFLQ+x2BG
 kgA8gBeqJ/CuCrxdFjz/qnKJrLdkNR8zFjZ2EriQOzunkSnB5PydDqricAGJEoSFwCGd
 yA0+8T11Q86qjWBowhIREzGRAqFV7pnBzEzcgMTVZKXoTVgLUDOa+icYy4ucdQqmiaWt
 R8wEF1r3SlUCJ8G64WKHJOSZ8aKOw4e4bAIllZ6v1zIwXrHi046IkcK19Fa9BFoDTEm2
 4fHIgrpVIso+UsMHUsngnnaNKg0GnAteZ7VYFU7QW1iiYbuQm2l6EDUmKoGwfe9u1TEB
 3zSQ==
X-Gm-Message-State: AOAM53341FstKPM5kb+50H7IsUjPuqeVh/zYKso0APLD7Cgf6kmFiPRB
 VEg0sRpMmQqU+jebDK9CptzJkQ==
X-Google-Smtp-Source: ABdhPJz5avKKNTtvKZvm8lzBMm3rjxfvXiD2QxxVE3dZa7xUCBH4RpcsiIOy1AoeYJ/nBEZkwHHoAw==
X-Received: by 2002:aa7:9aa8:: with SMTP id x8mr11608662pfi.182.1589903326036; 
 Tue, 19 May 2020 08:48:46 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id c2sm9506pjg.51.2020.05.19.08.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 08:48:45 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jason Wessel <jason.wessel@windriver.com>
Date: Tue, 19 May 2020 08:44:02 -0700
Message-Id: <20200519084345.1.I91670accc8a5ddabab227eb63bb4ad3e2e9d2b58@changeid>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jb4UE-007YyN-U2
Subject: [Kgdb-bugreport] [PATCH] kgdboc: Disable all the early code when
 kgdboc is a module
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

When kgdboc is compiled as a module all of the "ekgdboc" and
"kgdb_earlycon" code isn't useful and, in fact, breaks compilation.
This is because early_param() isn't defined for modules and that's how
this code gets configured.

It turns out that this was broken by commit eae3e19ca930 ("kgdboc:
Remove useless #ifdef CONFIG_KGDB_SERIAL_CONSOLE in kgdboc") and then
made worse by commit 220995622da5 ("kgdboc: Add kgdboc_earlycon to
support early kgdb using boot consoles").  I guess the #ifdef wasn't
so useless, even if it wasn't obvious why it was useful.  When kgdboc
was compiled as a module only "CONFIG_KGDB_SERIAL_CONSOLE_MODULE" was
defined, not "CONFIG_KGDB_SERIAL_CONSOLE".  That meant that the old
module.

Let's basically do the same thing that the old code (pre-removal of
the #ifdef) did but use "IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)" to
make it more obvious what the point of the check is.  We'll fix
kgdboc_earlycon in a similar way.

Fixes: 220995622da5 ("kgdboc: Add kgdboc_earlycon to support early kgdb using boot consoles")
Fixes: eae3e19ca930 ("kgdboc: Remove useless #ifdef CONFIG_KGDB_SERIAL_CONSOLE in kgdboc")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/kgdboc.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 34b5e91dd245..fa6f7a3e73b9 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -43,9 +43,11 @@ static int			kgdb_tty_line;
 
 static struct platform_device *kgdboc_pdev;
 
+#if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
 static struct kgdb_io		kgdboc_earlycon_io_ops;
 static struct console		*earlycon;
 static int                      (*earlycon_orig_exit)(struct console *con);
+#endif /* IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
 
 #ifdef CONFIG_KDB_KEYBOARD
 static int kgdboc_reset_connect(struct input_handler *handler,
@@ -140,10 +142,19 @@ static void kgdboc_unregister_kbd(void)
 #define kgdboc_restore_input()
 #endif /* ! CONFIG_KDB_KEYBOARD */
 
-static void cleanup_kgdboc(void)
+#if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
+static void cleanup_earlycon(void)
 {
 	if (earlycon)
 		kgdb_unregister_io_module(&kgdboc_earlycon_io_ops);
+}
+#else /* !IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
+static inline void cleanup_earlycon(void) { }
+#endif /* !IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
+
+static void cleanup_kgdboc(void)
+{
+	cleanup_earlycon();
 
 	if (configured != 1)
 		return;
@@ -388,6 +399,7 @@ static struct kgdb_io kgdboc_io_ops = {
 	.post_exception		= kgdboc_post_exp_handler,
 };
 
+#if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
 static int kgdboc_option_setup(char *opt)
 {
 	if (!opt) {
@@ -544,6 +556,7 @@ static int __init kgdboc_earlycon_init(char *opt)
 }
 
 early_param("kgdboc_earlycon", kgdboc_earlycon_init);
+#endif /* IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
 
 module_init(init_kgdboc);
 module_exit(exit_kgdboc);
-- 
2.26.2.761.g0e0b3e54be-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
