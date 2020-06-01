Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A811E9C52
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 Jun 2020 06:05:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jfbhO-0003tt-Sm
	for lists+kgdb-bugreport@lfdr.de; Mon, 01 Jun 2020 04:05:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jfbhN-0003tc-8j
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Jun 2020 04:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8IbvAoLGL035YlltQtpP00AwXGMYJV9lrNv+bBOdgVA=; b=DowhxKvoOJZSqt7kWV3UE2JxTI
 1OwqM+FegAmnGavYMzKuQqubZJrnrzDg5h2G5MsY+xQnfkbb9+g+DgEBq+CClOJUEnv3tx3rm7F7W
 O3IHGG4qtptml9ZwZJZ962tvAMPEzpG06d8hfTafEnggyhUFss927bOjfX/z90niqtCs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8IbvAoLGL035YlltQtpP00AwXGMYJV9lrNv+bBOdgVA=; b=cJHpJxIAk1Z2AVHn/LLJ7H298A
 7YAFZhH1hzBCGFSJj5hEhmHi5+WCsPV19KL6GVvXtxYnYcwH85dxhFw4AGhUsrSLhP/5W9ZkLBLHI
 Jff+OhOMYfpIiHqkv/NJL6jata+T79o5E/Nc9kokn/QSF85mTORpN3bjMHDclfPhipZ0=;
Received: from mail-pg1-f182.google.com ([209.85.215.182])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jfbhL-002nVj-DC
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Jun 2020 04:05:17 +0000
Received: by mail-pg1-f182.google.com with SMTP id m1so2884733pgk.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 31 May 2020 21:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8IbvAoLGL035YlltQtpP00AwXGMYJV9lrNv+bBOdgVA=;
 b=Rx4ZgrLnzA8+d15P6Z5plMMXRBA4qJ719JLLzx0WQKzXZ1z0tdbDdUblk5JL0Oay3z
 nR2QCbRBnhvP8CVrwzk7ziB9zR5twsYO7XfFTdapDS6CyIrOWCSCDrfFKzBfVZrqHFDV
 LbHsGJ5tCJ5Gy6EB9Mv3QxjGbc5eMiotj/WGZPlpPDV55IeF9kNBG0lmJARfAyc+YE2l
 NBUfbmC3iGc+7VYz0fkmuJaS3x+GOmjIZBRVr6xkPviRu+lsGCqIc+EEVM/LrjkSh8d8
 azi+hJUrNut3XBoxak2A3KuxK+NGDA3PbiSxyne/pdkASWXt1pNBd/PmVz5FbjZB8Owg
 Yxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8IbvAoLGL035YlltQtpP00AwXGMYJV9lrNv+bBOdgVA=;
 b=FXon3leRzVmRVm074IBeTXz7fg177nD8ly/HTBtK+tZp52PQcQ0dG3qMJiiVJ5x/LA
 Ry2LxE1crVQaSol+0Y+KKQO5TC7x682bL0ylMubbfsR/JoXlKh7SwGjjr/DXpl6PkgiZ
 ogS2tvaGNABW91eDy/l330JefpTcIaX50MjCONJYL7UyqGKohM25re8KJ6fgyJ0MFa5a
 0j/ygalnhev5TpMC4RB75C+XDtOZ22qRi2fOULSnXlRB00qc9CkdLVw9jEyZGtJ1IJ/3
 pKWCV6jeiNBrk+WOBMIx7KJwpcrhhzhLuHTRO1KoquNrIh9MbbBv+L7kQxQyRTOofP7u
 EqWA==
X-Gm-Message-State: AOAM530R5Pq8bI1PVS7/xPJoAh8/eVrSdoonP3piLA93c0jkRpL/jgaN
 ZM2ZzshldNRjndhg20yZtNGkkX6jCrM=
X-Google-Smtp-Source: ABdhPJxF8TkOzad2OFkCz03xBGKg9b30SzsKJpjz+L6ZjKY4SDHV6xcig8EQCFLBAYXELH9/jpbW/g==
X-Received: by 2002:a63:5fc8:: with SMTP id
 t191mr17497244pgb.185.1590982803136; 
 Sun, 31 May 2020 20:40:03 -0700 (PDT)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (2001-b400-e3df-96c7-30f0-f751-b645-f4e3.emome-ip6.hinet.net.
 [2001:b400:e3df:96c7:30f0:f751:b645:f4e3])
 by smtp.gmail.com with ESMTPSA id a7sm13102527pfa.187.2020.05.31.20.40.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 31 May 2020 20:40:02 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, daniel.thompson@linaro.org
Date: Mon,  1 Jun 2020 11:39:09 +0800
Message-Id: <1590982751-13401-5-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590982751-13401-1-git-send-email-vincent.chen@sifive.com>
References: <1590982751-13401-1-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sifive.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jfbhL-002nVj-DC
Subject: [Kgdb-bugreport] [V5 patch 4/6] riscv: enable the Kconfig prompt of
 STRICT_KERNEL_RWX
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

Due to lack of hardware breakpoint support, the kernel option
CONFIG_STRICT_KERNEL_RWX should be disabled when using KGDB. However,
CONFIG_STRICT_KERNEL_RWX is always enabled now. Therefore, select
ARCH_OPTIONAL_KERNEL_RWX to enable the Kconfig prompt of
CONFIG_STRICT_KERNEL_RWX so that user can turn it off.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 85c5c1829cc4..c12d471280f7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -61,6 +61,7 @@ config RISCV
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
+	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select SPARSEMEM_STATIC if 32BIT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
