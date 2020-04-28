Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 070041BCE91
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 Apr 2020 23:22:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jTXgQ-0003ZE-R6
	for lists+kgdb-bugreport@lfdr.de; Tue, 28 Apr 2020 21:22:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jTXgP-0003Z1-O5
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rZjd+VbYFO+1h5w9yjkd4z7WzJT1OucgLbQwpoTJjsA=; b=hlnCjRlnPXb0rIti/v8ns9mYEW
 EAC5XzoljFDRLc2UDnMZYtveDW18poNH3GwgN5R08SxJ4xECfo80xuTC6iqm5tqzGwMTfTA8lZE8N
 C+eG91DNjbVrvHZE0922LRRuqr3liZNb3HU0hjWZt8MBhs2Z4cqMOhb5oIT1MvIrQMcg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rZjd+VbYFO+1h5w9yjkd4z7WzJT1OucgLbQwpoTJjsA=; b=W1itRISBTynbRZ8SihOypd3YJB
 wItxrVUmCrXmWBaTCiAlpU8xUFGPP+HF9EwXx9SIrPbcTMdaZubBslZjbys8qkiw5f1F1a5dD68DU
 sSsEOr1FvXdAqxuE9dtwc80H2aSclJIVXbqZNZGZ4IrVQ/HtKBJZ8z8aIOwILt6FESp8=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jTXgO-001Xuy-KO
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:22:25 +0000
Received: by mail-pf1-f193.google.com with SMTP id v63so11424633pfb.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 28 Apr 2020 14:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rZjd+VbYFO+1h5w9yjkd4z7WzJT1OucgLbQwpoTJjsA=;
 b=lOuY2Gb8Q6KEWCWP5EslFdqN/LC9fpknyHXTvHxdjmkFrI4r4rBzXjc+YvsJgRkzC8
 jVFG3uCPZlsic43UT0Gw9PlL0ei+sNW5WrQwsZuTvSukWMWJru6i3GMWhWwif4PdhBsQ
 ZgHdHDF/dHq26QcWnl9DHKrCzM+M+E2zX43nE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rZjd+VbYFO+1h5w9yjkd4z7WzJT1OucgLbQwpoTJjsA=;
 b=bPSEXiFjCmD0m3VUZUGMhlxtSenSuxsXEVrY3tw46d9nIbIfewJyWmlLuGdaTQvMBp
 PCukGE5Mqjl9mtk5mgSkH9pqEhIBlTIZpcNIcjKH8wVH2emh8NhuTSExVbadCA4nfRxq
 6dWsLQlraJ5iZR6NsGOGLBoOIh3IaLdWDGaR+StfyTO4yL+GEeQIZazguykMUbMei6UM
 Pyi/7uqznFP7m0JbUMRlZjLjfSNXGaGsTR/icW1QhKNp0D/Y3Q3VVVRim2yS+qlIh13H
 oWm46Iybv7AH8YKTN1LqCQ/CTBEa+9OcFAAYFGEeMDsJm46foo6Wm79YkS11TnIqCpyT
 PNMA==
X-Gm-Message-State: AGi0PuaZ+vhqjhjSulBU13ZlrreSEDuqYUqGRT3fTYxGjNpEuxQ/g7JH
 bPHVUTqD66maTmEhZXwwdEUUni+VnThzYg==
X-Google-Smtp-Source: APiQypJNo1Mwq4p2UlVCx+CzUxAgHlfOnMX98dr2BJvlZvshU+HZaiGJ8EAOQ3FI12KaD0Dtngashw==
X-Received: by 2002:a17:902:262:: with SMTP id
 89mr30540617plc.131.1588108466854; 
 Tue, 28 Apr 2020 14:14:26 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id 18sm2988202pjf.30.2020.04.28.14.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 14:14:26 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Tue, 28 Apr 2020 14:13:46 -0700
Message-Id: <20200428141218.v3.6.I89de39f68736c9de610e6f241e68d8dbc44bc266@changeid>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
In-Reply-To: <20200428211351.85055-1-dianders@chromium.org>
References: <20200428211351.85055-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jTXgO-001Xuy-KO
Subject: [Kgdb-bugreport] [PATCH v3 06/11] kgdb: Prevent infinite recursive
 entries to the debugger
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
Cc: corbet@lwn.net, kgdb-bugreport@lists.sourceforge.net, hpa@zytor.com,
 bjorn.andersson@linaro.org, agross@kernel.org, bp@alien8.de,
 linux-serial@vger.kernel.org, catalin.marinas@arm.com, jslaby@suse.com,
 tglx@linutronix.de, will@kernel.org, mingo@redhat.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

If we detect that we recursively entered the debugger we should hack
our I/O ops to NULL so that the panic() in the next line won't
actually cause another recursion into the debugger.  The first line of
kgdb_panic() will check this and return.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- ("kgdb: Prevent infinite recursive entries to the debugger") new for v3.

Changes in v2: None

 kernel/debug/debug_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 503c1630ca76..faf5bd4c34ee 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -532,6 +532,7 @@ static int kgdb_reenter_check(struct kgdb_state *ks)
 
 	if (exception_level > 1) {
 		dump_stack();
+		kgdb_io_module_registered = false;
 		panic("Recursive entry to debugger");
 	}
 
-- 
2.26.2.303.gf8c07b1a785-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
