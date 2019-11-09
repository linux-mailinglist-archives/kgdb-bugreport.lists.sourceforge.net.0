Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F616F612C
	for <lists+kgdb-bugreport@lfdr.de>; Sat,  9 Nov 2019 20:25:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iTWMp-0004pw-3O
	for lists+kgdb-bugreport@lfdr.de; Sat, 09 Nov 2019 19:25:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iTWMn-0004po-Ob
 for kgdb-bugreport@lists.sourceforge.net; Sat, 09 Nov 2019 19:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UdlwD0l05r56537ZBZYEooUnd8vbBxRtlaKpE7fqAgY=; b=lI9Uk0H+fvTTjTJJIy6FOfIV0k
 XuLsfy0J5eYt0ZyhJmwUZNZqbOWzDkRBy00QjzFwxdAK3c8gsTtyaLuX4USFQZtrud4v6YXz2XX1S
 EqBF+2JunD2trmYM3Y8QVMOxEa15WmktN/SKA322u91HpkDatylU9vWCB1+MsFVJBWK8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UdlwD0l05r56537ZBZYEooUnd8vbBxRtlaKpE7fqAgY=; b=TKsXIuWkV+HF6sysPR94ADLtAf
 sgK4DesePQwmFJgTsIz8AT/TAOATw6vfytdWozNmEA9+HvpqNPtFI8atmvEqahYKv+if4PI4EXFZm
 kH8Lja4KB6YbA0HKda2W4GCte3A6QKoTGa2UY8oUdaEdJnw+dY0CAatuhOLCrHx5rPGU=;
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iTWMi-00Bzau-QZ
 for kgdb-bugreport@lists.sourceforge.net; Sat, 09 Nov 2019 19:25:49 +0000
Received: by mail-io1-f68.google.com with SMTP id j20so9686387ioo.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 09 Nov 2019 11:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UdlwD0l05r56537ZBZYEooUnd8vbBxRtlaKpE7fqAgY=;
 b=NLQ6dNGBL5ct6UJg2zXevzC9R85rhjVpEA/eT4radmFPIgj37/pjxfoV34DQie4lTh
 TE4+U3wNwWf4Ci2oq0z1pRyZ7I7ZfIheiQWvUXZopwXMO8fYuFLiGtXNCXjOOTOdD7mX
 rESo8a7OKHr6CB4kPC5aiR1O8Qig+P5oawiuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UdlwD0l05r56537ZBZYEooUnd8vbBxRtlaKpE7fqAgY=;
 b=mKRz05U5UYWdb/mpYnVxuDHN2+7JnvXpbzlRzjZGiJ3Wi433k1ffsLdmQHi7Re6+e+
 uMXLGAJjQ6Y6C7jRrCK33mfR9RdEjhh1ZVCfVrhzjY8cT1T0OYhkZBo9hDo0xJOQ1peQ
 2zd2irONO0Q9AI+lki4a+DOWL7PkGHFamuevkBIQYgorrfNEw3fKJJ4S7g2leKb3p1QD
 6VkM+uB4t2rkmWYw6GXw5BekQZcRb7UZkFLhrAoLADy631OnzfCbncB8Q0Nk3d5xf71b
 2+fK64hLb+KqKlN2fVOpW3gBBE+YBiNBOuLh2xjawiNzdM56MWIkJPIq+fGGZ3F9u68p
 9lMw==
X-Gm-Message-State: APjAAAWPuQgedAyQWPG0tMwOAqacWE8YQzvlo+DRWIkQ98QCVyclVl0p
 Crx90eXTBd5q+JGgPbBEnk8LRwx3Uxc=
X-Google-Smtp-Source: APXvYqyTjqH2ukN5+R/IrhRSCm7VfIfTxcGx/J78VEuTMSsmPKQJE+5BxRcNcYkWSBUKVLBqE+l7Nw==
X-Received: by 2002:a63:555b:: with SMTP id f27mr19571417pgm.66.1573327071863; 
 Sat, 09 Nov 2019 11:17:51 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id i11sm9193577pgd.7.2019.11.09.11.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2019 11:17:51 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Paul Burton <paul.burton@mips.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Sat,  9 Nov 2019 11:16:42 -0800
Message-Id: <20191109111623.3.I14b22b5eb15ca8f3812ab33e96621231304dc1f7@changeid>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191109191644.191766-1-dianders@chromium.org>
References: <20191109191644.191766-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iTWMi-00Bzau-QZ
Subject: [Kgdb-bugreport] [PATCH 3/5] kdb: kdb_current_task shouldn't be
 exported
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
Cc: qiaochong@loongson.cn, Christophe Leroy <christophe.leroy@c-s.fr>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 kgdb-bugreport@lists.sourceforge.net, Chuhong Yuan <hslester96@gmail.com>,
 ralf@linux-mips.org, linux-kernel@vger.kernel.org,
 Nicholas Mc Guire <hofrat@osadl.org>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The kdb_current_task variable has been declared in
"kernel/debug/kdb/kdb_private.h" since 2010 when kdb was added to the
mainline kernel.  This is not a public header.  There should be no
reason that kdb_current_task should be exported and there are no
in-kernel users that need it.  Remove the export.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 4567fe998c30..4d44b3746836 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -73,7 +73,6 @@ int kdb_nextline = 1;
 int kdb_state;			/* General KDB state */
 
 struct task_struct *kdb_current_task;
-EXPORT_SYMBOL(kdb_current_task);
 struct pt_regs *kdb_current_regs;
 
 const char *kdb_diemsg;
-- 
2.24.0.432.g9d3f5f5b63-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
