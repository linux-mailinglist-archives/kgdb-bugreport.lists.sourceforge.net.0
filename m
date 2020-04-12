Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1141A5BD6
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 12 Apr 2020 03:42:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jNRe6-0004Qp-0U
	for lists+kgdb-bugreport@lfdr.de; Sun, 12 Apr 2020 01:42:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jNRe4-0004Qd-7f
 for kgdb-bugreport@lists.sourceforge.net; Sun, 12 Apr 2020 01:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5aQkCdg3OoDULAq8LLMFvMfwkl2FbDtSgUr/S5jyTE0=; b=bSo4SduqT6cn5YJeXuKYdt0YeE
 GPuZwksuFs+i4arzl72Qlag1hzj53JzkV3COYfPOhq4ZbiYUcf04OS6C3jVYVP9M/FnO0YRKH223D
 YByFjWcGMXOpaxxgEitxoVXAuJ1M7D0R+tFvhvwioCCGJ7/eS72hLzKtYInMFI9Q9a8s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5aQkCdg3OoDULAq8LLMFvMfwkl2FbDtSgUr/S5jyTE0=; b=eSuvJVwVNXedB20iMSApbP2aWg
 F6h9/pBZpSeeH7p6gHhOqn70HDJsXy/Z88VG0bIrL7i6tcnYXt79FiVMOAwBsoluAd8UHxWFcKFWY
 GjPtRNwPxln1Al847TAlMKkdku4naKb46M0rCBiBqjKA9/NAPyTA32R35J4aNiaqIj9Y=;
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jNRdw-00FaU7-Lw
 for kgdb-bugreport@lists.sourceforge.net; Sun, 12 Apr 2020 01:42:44 +0000
Received: by mail-pj1-f67.google.com with SMTP id e16so2108794pjp.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 11 Apr 2020 18:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5aQkCdg3OoDULAq8LLMFvMfwkl2FbDtSgUr/S5jyTE0=;
 b=Ypcd1uccGRBWnr0na4M5FZ/bdMeVnn9NswxKVeeHemUTKPAqMfaWhuqouAhzQbKnbQ
 5P7NvYwRCHe+jrNDCP1GWRleNAEn02yUT/JgYxUMGd8PtIsxyYF10Fs9URQAmWuj4JAj
 T/RpD3jg790TYZkfAwFDPw2iyWCpFvHcRD+QJH5lj4ssgF0mtiPOcdF70nc/6S1dAx1N
 az1lYW4B/5jkmKi97jcx6lTqLVUeIG07EL7sYwmYo7WJog4q1DCi1/91+TRE3q1l97vE
 APGAvIvelCkNrd0V+1gGJ0j8CTrTARwOEY6osTBVhwvMvEhZdgLoaMz3zxYuh8RXrK+y
 Tn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5aQkCdg3OoDULAq8LLMFvMfwkl2FbDtSgUr/S5jyTE0=;
 b=YOTDnv8mCg6P6gdlsQ+gpEtqxW6hbv3CwC9Ncm6eBKA0aDAglCyHUF02EEB/eAWOX0
 /X9U9qd2FA2uVBIpR4kRQUQAbhvvgKU4wlRDKuNOY2Il/4BCo7BTWhs78f95UUs+UBaW
 yfxArZ6/z8fCfOn37fiXBpKrguUjX0gfC/LHnWkAmbPlBkRhvFVOVpcV+bFOVWfFUxIp
 RrKyBDMtm5pOzuB6fMcWBkZWDrIzsIWsVl7pbzAZQ5JyRKSW6oUS32YKKD4uv69f78uv
 PoC+MbAskTKAQahS/mmhY+kd/IfTiCZEANxLwb5vJJfnuLhUBSMbyecmdPxudgEF3yzx
 r4SQ==
X-Gm-Message-State: AGi0PuYtznBXe2lWya2+WgdbdnRL6LA+2o9qwGUgYYzNrSp4KHAlzP5f
 4QEnCCuvepRgVrJk+bfzTSdz/A==
X-Google-Smtp-Source: APiQypJZMNkid4SD3TvUZnv2Uc1XwGLlL/3GhLZK9cbCjsmfMW3ay7qZazE3y9kakkMYoPhdtwaj8w==
X-Received: by 2002:a17:90a:734b:: with SMTP id
 j11mr14331497pjs.10.1586655755028; 
 Sat, 11 Apr 2020 18:42:35 -0700 (PDT)
Received: from localhost.localdomain (123-195-35-41.dynamic.kbronet.com.tw.
 [123.195.35.41])
 by smtp.gmail.com with ESMTPSA id w90sm5252900pjj.2.2020.04.11.18.42.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 Apr 2020 18:42:34 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: daniel.thompson@linaro.org, paul.walmsley@sifive.com, palmer@dabbelt.com
Date: Sun, 12 Apr 2020 09:41:57 +0800
Message-Id: <1586655721-22567-2-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586655721-22567-1-git-send-email-vincent.chen@sifive.com>
References: <1586655721-22567-1-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.67 listed in list.dnswl.org]
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.67 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jNRdw-00FaU7-Lw
Subject: [Kgdb-bugreport] [PATCH v3 1/5] kgdb: Add kgdb_has_hit_break
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
