Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AB51C0202
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 30 Apr 2020 18:18:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jUBtA-0003Yq-Ld
	for lists+kgdb-bugreport@lfdr.de; Thu, 30 Apr 2020 16:18:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jUBt9-0003Yj-Tc
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Apr 2020 16:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5bAsvHqWCwGkT9CQd5T/W8xxkcoMDs4/cE7bMjlYKe0=; b=FZoiVdPzAcMGci/IvCKdlJ6JyT
 vx2UqNFUD7XyzEPwaamldGXbLlCluZ8pFet+Fug5aVa5UwraH7LZmtQosFcQXmiP9ILAHGxRB/uTz
 utx4OlOcVbcktmAxv37E0Ok7k+u1x5hdGK3Wu8R26bsWYMXFwt733Qok2FAPI2QPlucw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5bAsvHqWCwGkT9CQd5T/W8xxkcoMDs4/cE7bMjlYKe0=; b=e/3HCHJ5v60yuI4RJjMwXnsnpx
 29S8La3KBFZmyUxCfanPXbHHvP6vloim0kiRLZEuWHKFleUSOR9mWeKmZ8J8EibADWfcfqIqQQobj
 LZQudkoyoG7GZzn4s1fD6A6MJJZvFvWDcWr5b2dMuwwwSo3V05KxfBp9MpHdUckEff7I=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jUBt6-005Rkp-Nm
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Apr 2020 16:18:15 +0000
Received: by mail-wm1-f65.google.com with SMTP id g12so2619742wmh.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 30 Apr 2020 09:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5bAsvHqWCwGkT9CQd5T/W8xxkcoMDs4/cE7bMjlYKe0=;
 b=gbHXr1KRjKzHoWccXlTIFlKA6SNRGpxXOO+JrrqgTvF8sYDdJfErPMiJJXwfzBd82v
 +Bp0Fn/5Bb8Gtwik2V1YrWSCqY7eslqiV5SJZQSfWPtOaDewmOSMtwJ7Bzs9PFtODxoR
 RH7O/FjGUW8detzTpo+wXVG3U2QUMlLmWBYXJF5Eyzv2rUOCusSe4RelyEqOkdYzr16H
 13FPv5lrfR0iidWprYTw97a8ojDJa0Zj30usR+mgFPxUKVVsrJ226gWyB4GvZHeCPtwn
 AEmL2ybLlvTiEIWqjII/JOaclnZlhSDE4LV+MfUFikvplidy4TPP4nHQM016g7+PbXmc
 6Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5bAsvHqWCwGkT9CQd5T/W8xxkcoMDs4/cE7bMjlYKe0=;
 b=rTM3aRVexNtJPBNdsU7eUs58czlmStxrEEZIR7dZ603aE0Cg6maDXVkRKWq3F812jp
 SaqpB5eA8l/ySmR2krmhOx0LrlFXjOdeS99b4dITa/KscAqVXqJ7fX/Y9bTNCh9qBnkn
 TAKOB0U+yBMzgsscg2B+ZWK/Ahp5iN3w9VxS7vzapD2G+wNfJXnZbA2OU8B1S9lXXJaC
 MDD8cFL4Rcy56P4mOVWKzp8GtUqZnG2bSFWrHota3pi1mKN1jy6gf0wKQifmpLTYh+Vg
 SIMUXqjy0MWzaHf7nTtx4Ary60r35/jTVfv3b+gYgQFYnh2d7HF9OVjv2zxbEO0DSpmO
 9nBA==
X-Gm-Message-State: AGi0Pua73drE6GlQAH/K8E7cOsEUO0ZWvfHU6Xgz+X4Oq8D0Ju8CNFvN
 LPHF2UsAfAga5DKP5MIu2XdWKg==
X-Google-Smtp-Source: APiQypLdCkOL76wT2MKicI01rEncdS8lGfzgse247Irn4tIefaTYWYzAtLZod6xQ+/HXO2xHj/xMhA==
X-Received: by 2002:a1c:1b88:: with SMTP id b130mr3766023wmb.75.1588263486041; 
 Thu, 30 Apr 2020 09:18:06 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id y18sm160634wmc.45.2020.04.30.09.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 09:18:05 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2020 17:17:41 +0100
Message-Id: <20200430161741.1832050-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200429170804.880720-1-daniel.thompson@linaro.org>
References: <20200429170804.880720-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.65 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jUBt6-005Rkp-Nm
Subject: [Kgdb-bugreport] [PATCH v2] serial: kgdboc: Allow earlycon
 initialization to be deferred
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, patches@linaro.org,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently there is no guarantee that an earlycon will be initialized
before kgdboc tries to adopt it. Almost the opposite: on systems
with ACPI then if earlycon has no arguments then it is guaranteed that
earlycon will not be initialized.

This patch mitigates the problem by giving kgdboc_earlycon a second
chance during console_init(). This isn't quite as good as stopping during
early parameter parsing but it is still early in the kernel boot.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---

Notes:
    v2: Simplified, more robust, runs earlier, still has Doug's
        recent patchset as a prerequisite. What's not to like?
    
    More specifically, based on feedback from Doug Anderson, I
    have replaced the initial hacky implementation with a console
    initcall.
    
    I also made it defer more aggressively after realizing that both
    earlycon and kgdboc_earlycon are handled as early parameters
    (meaning I think the current approach relies on the ordering
    of drivers/tty/serial/Makefile to ensure the earlycon is enabled
    before kgdboc tries to adopt it).
    
    Finally, my apologies to Jason and kgdb ML folks, who are seeing
    this patch for the first time. I copied the original circulation
    list from a patch that wasn't kgdb related and forgot to update.

 drivers/tty/serial/kgdboc.c | 41 +++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 7aca0a67fc0b..596213272ec3 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -509,6 +509,10 @@ static struct kgdb_io kgdboc_earlycon_io_ops = {
 	.is_console		= true,
 };

+#define MAX_CONSOLE_NAME_LEN (sizeof((struct console *) 0)->name)
+static char kgdboc_earlycon_param[MAX_CONSOLE_NAME_LEN] __initdata;
+static bool kgdboc_earlycon_late_enable __initdata;
+
 static int __init kgdboc_earlycon_init(char *opt)
 {
 	struct console *con;
@@ -529,7 +533,24 @@ static int __init kgdboc_earlycon_init(char *opt)
 	console_unlock();

 	if (!con) {
-		pr_info("Couldn't find kgdb earlycon\n");
+		/*
+		 * Both earlycon and kgdboc_earlycon are initialized during
+		 * early parameter parsing. We cannot guarantee earlycon gets
+		 * in first and, in any case, on ACPI systems earlycon may
+		 * defer its own initialization (usually to somewhere within
+		 * setup_arch() ). To cope with either of these situations
+		 * we can defer our own initialization to a little later in
+		 * the boot.
+		 */
+		if (!kgdboc_earlycon_late_enable) {
+			pr_info("No suitable earlycon yet, will try later\n");
+			if (opt)
+				strscpy(kgdboc_earlycon_param, opt,
+					sizeof(kgdboc_earlycon_param));
+			kgdboc_earlycon_late_enable = true;
+		} else {
+			pr_info("Couldn't find kgdb earlycon\n");
+		}
 		return 0;
 	}

@@ -543,8 +564,24 @@ static int __init kgdboc_earlycon_init(char *opt)

 	return 0;
 }
-
 early_param("kgdboc_earlycon", kgdboc_earlycon_init);
+
+/*
+ * This is only intended for the late adoption of an early console.
+ *
+ * It is not a reliable way to adopt regular consoles because
+ * we can not control what order console initcalls are made and
+ * many regular consoles are registered much later in the boot
+ * process than the console initcalls!
+ */
+static int __init kgdboc_earlycon_late_init(void)
+{
+	if (kgdboc_earlycon_late_enable)
+		kgdboc_earlycon_init(kgdboc_earlycon_param);
+	return 0;
+}
+console_initcall(kgdboc_earlycon_late_init);
+
 #endif /* CONFIG_KGDB_SERIAL_CONSOLE */

 module_init(init_kgdboc);

base-commit: 6a8b55ed4056ea5559ebe4f6a4b247f627870d4c
prerequisite-patch-id: cbaa70eb783f1f34aec7f5839d1fecbc7616a9f6
prerequisite-patch-id: d7543cdd19fb194ded3361d52818970083efdb06
prerequisite-patch-id: 2238d976451dac9e3ee1bf02a077d633e342aa0c
prerequisite-patch-id: 9e4296261b608ee172060d04b3de431a5e370096
prerequisite-patch-id: 2b008e0e14a212072874ecb483d9c6844d161b08
prerequisite-patch-id: f5b692b89c997d828832e3ab27fffb8f770d7b6f
prerequisite-patch-id: 851d6f4874aa24540db9d765275ae736e8b2955b
prerequisite-patch-id: d3969c2fb7cd320eafebe63d7da270dac5a82fc9
prerequisite-patch-id: e1fc1478b7f75094d263ffc64a9f3528151831cf
prerequisite-patch-id: 45fb53996a9f5993e03673c10eebf2834c58307f
prerequisite-patch-id: 50ac1ddb52c3cce8b712036f212fdd67d7493112
--
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
