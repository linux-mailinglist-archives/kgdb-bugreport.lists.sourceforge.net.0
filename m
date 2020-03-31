Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D0619AC82
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  1 Apr 2020 15:17:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jJdFM-0007WV-0U
	for lists+kgdb-bugreport@lfdr.de; Wed, 01 Apr 2020 13:17:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jJJ8Q-0001kK-8P
 for kgdb-bugreport@lists.sourceforge.net; Tue, 31 Mar 2020 15:49:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5aQkCdg3OoDULAq8LLMFvMfwkl2FbDtSgUr/S5jyTE0=; b=mTFFHhqt8wwmClmhaRiFhummLI
 4ZXxlcMTcyfyDiuXFnQ6cX78Apu4NUdOW0dEWVXD2k3qQ4fevc+KvQPtIcD/niKydK/qsa9wDvAz+
 9m/aHzfZND0Wm+kirpvtnvDrHU1w1dLSxufpcxneJJWjAjJ2gh71HUlgBHEqvC19Vwos=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5aQkCdg3OoDULAq8LLMFvMfwkl2FbDtSgUr/S5jyTE0=; b=fNYErrEXV8n25WTuQVy8ZOSYN9
 X5ghiAY78pPKKhArWb7jf2ZfBWXBu7fwTfAnceU+4aKyLaX2pq1VK+IRyEyRgpx5qIJc33+NJPWQx
 Jawdknu8wy2Rz4HoR6qlP/cKMDZKa3wx1zOyC7KeL63I6INvaTsFQ3M10DYchlolwtt8=;
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jJJ8M-00EF4N-ET
 for kgdb-bugreport@lists.sourceforge.net; Tue, 31 Mar 2020 15:49:02 +0000
Received: by mail-oi1-f195.google.com with SMTP id t25so19329666oij.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 31 Mar 2020 08:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5aQkCdg3OoDULAq8LLMFvMfwkl2FbDtSgUr/S5jyTE0=;
 b=gV/o0CDRlWRC5hqOTTAwBJXyxpg7vFKl7HdX4ht9K/R9ZfhMV2uVKzoEFX1Jyg1TEf
 9Ymob3UBmIDpJRcb9CtZ+zdHejt0KkANEtXEZGsacx+gRoJNqHoA8JoqvC4MHX3/o21O
 v/fWRwFFgBgkyp0Mm/LnWY1h/U1u0ojXzXbK2SChw0azbD2iPlHkCYeE0hrsfriU8q//
 +WxMY1/wMpHcinT2sDGerb6xNT8VYt50EXB+vCbl2hUSWLp8rhN14V2HR0NDzuJ5CdAk
 IhYXrBcqVrIyUkXFw7MXieNikdWfeQkBIkZ+hmu6LlzeqNLp4E2+4OJaLJnT81DJ4X+k
 0V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5aQkCdg3OoDULAq8LLMFvMfwkl2FbDtSgUr/S5jyTE0=;
 b=ZpiJONbo2XHq5I8dm3Saskf9pAxmlLRj5PqQjD/YLZpMAEkrt2dD/Pnj3jG/K2YJqF
 Q4vSSjK2FEMQz8PbFwSKA+1MDwlenHw5rYWfVNzqOhWC7YMfF0rcsS++mqcG6WYaW4sk
 ecJdNViV8TAWFZMBZnnNNBw8dFmDsJoVAmSm+9m8dsMjygMnwz2zOMZZihoRrADot8kf
 tDGPvL5uXjnA3LheVLDDcvh0vfJLJtyRqAfPtgbdO0chHBL7jb2cOAz7grNpBPwsijMY
 jMiRa55llML3FHu+hAeczhkRucqck0GYNvskDx6YQW8UGPPek715cZbAv6sgdf31wNra
 KZOg==
X-Gm-Message-State: ANhLgQ0dRrjQQSmCCpBWjBdvHl6TC/bMSOZK4Rd163aK7O4KWuCWojtQ
 0xrUxYT0IuHhbba4Sm7IwCQYeLtUwcU=
X-Google-Smtp-Source: APiQypIQPs0Ep2t3Ki3oPn5ufXwqeZTGDd3c8oxshzo+/6JD4Dhrvcf3WmDV+p6XbwFCCZmYIx0EVg==
X-Received: by 2002:a17:90b:110f:: with SMTP id
 gi15mr4581906pjb.184.1585668211402; 
 Tue, 31 Mar 2020 08:23:31 -0700 (PDT)
Received: from localhost.localdomain (123-195-35-41.dynamic.kbronet.com.tw.
 [123.195.35.41])
 by smtp.gmail.com with ESMTPSA id g30sm12097660pgn.40.2020.03.31.08.23.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 31 Mar 2020 08:23:30 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, paul.walmsley@sifive.com, palmer@dabbelt.com
Date: Tue, 31 Mar 2020 23:23:07 +0800
Message-Id: <1585668191-16287-2-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
References: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jJJ8M-00EF4N-ET
X-Mailman-Approved-At: Wed, 01 Apr 2020 13:17:31 +0000
Subject: [Kgdb-bugreport] [PATCH v2 1/5] kgdb: Add kgdb_has_hit_break
 function
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-riscv@lists.infradead.org,
 Vincent Chen <vincent.chen@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The break instruction in RISC-V does not have an immediate value field, so
the kernel cannot identify the purpose of each trap exception through the
opcode. This makes the existing identification schemes in other
architecture unsuitable for the RISC-V kernel. To solve this problem, this
patch adds kgdb_has_hit_break(), which can help RISC-V kernel identify
the KGDB trap exception.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/debug_core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 2b7c9b67931d..01bc3eea3d4d 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -417,6 +417,18 @@ int kgdb_isremovedbreak(unsigned long addr)
 	return 0;
 }
 
+int kgdb_has_hit_break(unsigned long addr)
+{
+	int i;
+
+	for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
+		if (kgdb_break[i].state == BP_ACTIVE &&
+		    kgdb_break[i].bpt_addr == addr)
+			return 1;
+	}
+	return 0;
+}
+
 int dbg_remove_all_break(void)
 {
 	int error;
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
