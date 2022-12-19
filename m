Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC9565BE5B
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  3 Jan 2023 11:46:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pCeoe-0008HL-Ms
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 03 Jan 2023 10:46:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <deller@gmx.de>) id 1p7OM2-0004qw-DJ
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 19 Dec 2022 22:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c8VSGyoB/IXpz/1GK/7Is+n7g8wLcSvzlbNDQWJUhvU=; b=lpuojJXW4BkJ+cHb0MuSA9Cj93
 WeMk+eCRIXn0Hk8rKxhE/mrlEk9NLQgr/bdpLUwLv9mBSMzBUl/Kq/qN3KEcyUBYsgMymTB26GOZJ
 ImUySLVg5O8WmEBcvrtlNuJaWwoDpPo/aVNocd4fg8mi4MgpwtjikBnflaZGk0HqQFv4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:To
 :From:Date:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c8VSGyoB/IXpz/1GK/7Is+n7g8wLcSvzlbNDQWJUhvU=; b=J
 2dvOCBpDpq8lFyu5fRk+vxkkHa1ycVc8KAg1Eu+ThleTyBpjFgIJ6h0Rmd7MZ8EarPLvxDRVucFXN
 Im+NuLMlSW6TxQi/ph9q1k3m75bIonyTYhS8fS6C4zaRQ0n2Q3+SL9fo0RGFxg/Ueco1Ax1OWKEcS
 VdUNAsNewlEnaUwU=;
Received: from mout.gmx.net ([212.227.17.22])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p7OLz-0001KH-LQ for kgdb-bugreport@lists.sourceforge.net;
 Mon, 19 Dec 2022 22:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671487869; bh=K2EDOySx3e1K1M2Anbv1nouYBXnEanEBXLSLF848xX8=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=YklLvXk+/2VxskOfGV66g034VB5921jn6KDiVw9TfYNTNbpBd1CevRrCZl0G/FXNd
 1aYPHy0O7tnfSmGGYJp0z/Gr/CHcb73V5V3eFASuc9wguVXyEv6A5oqW9j1Vl4La2o
 uMwFrRTkpBo6CuS7iv0GXbQsMH7gSb7UnFrvGbycVMhPRmOgA5yqfgRagpTGCGiAtb
 m/mjlDJZxsPokCzCB2x3jKJKavLfcPDyI1v4B7NUOLkfa41Di/4CrXh1/1f6MnTHvn
 v80VbO6sFmHduA6jzqkEFanWV2/jtehUyKRT9OWhdEsAOwQaz56szbw7X6kwJOIFFK
 UEEB1HcvY0peg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.151.196]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MplXp-1oXE6S1BVN-00qB7Q; Mon, 19
 Dec 2022 23:11:09 +0100
Date: Mon, 19 Dec 2022 23:11:07 +0100
From: Helge Deller <deller@gmx.de>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 kgdb-bugreport@lists.sourceforge.net
Message-ID: <Y6DhewN27vMnfgzT@p100>
MIME-Version: 1.0
Content-Disposition: inline
X-Provags-ID: V03:K1:gYs4UBNKqdHIiHtG5edr7pF1FQNSwuyyVUIiRyv8jaiDBuzXgQW
 CSCg7MHI9aKJ8ryP9eFSJ7S2nVoDosL82KJ2MEg+bETRJV9twzxBLMps5HvGP8qyx9aLBIe
 SNz6BoKIAkwXlgknIYqL48weFFxJomuNRrrr3IhInnzzkE8GUwe1VLkReaVUBMAmNzKc7zG
 P83XYMBfI+XhzDMsK27BA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AfGLgSvlyrE=;mA5cAY8HSVN33bk+5iR9QQn85mK
 7IEiqBHU2dRaB76cG5rDUhlsrvkYmI2qomZfdgFMRi7Rrc47OMmcYWv4beTBSx0UkGsijogay
 dg66rfBfKgaf8Z2m78oRydExNcuaCfgiH4PE7tXe01wxdO1h51UrDvLJAEyixT6BNyfLkJydv
 3gKtcNrcKnvuw4bIx5lG8WOkf+umZU6VpeCtVRaOr+l2icDY4np65JsFvH7hV751FY0Kf2NH6
 04yV5SrpsygCx/IYXoW0RjUf+h9mu94CyRLo9XGxy4vgmswmJk2MLot/Ox+I3Zx9UwY0FxdQR
 s0DZClwVq87TletsSRLxg17w74x2Z+lyYXyYPQxmQXNbGHOk+H7MzydT0lWiF6w4RqI21P8gr
 6MGt3BetS1mqw5eLIKpOgPIo3b5fr5dIFqj5Hnr29I7XzRLKIeESB2FZqbQnrU955xbJKE5IS
 T7R+PmR9pWgx2tWektUjeNW6TUbgiEFOcm3c8hs2oKK7VbHPf1xgyODWj6pjNuGv+Eiq056dD
 0N2D6DcoIjXpeFFbRsDTWOzbyzcDe6f7aGsdmH2D2b3mf1Ck4Q3pcLEYrN37BwuOrknMXgQSo
 o+CqIsaGCiY/zrLmJXCc7BLAx0APdI/j1Nrv/7ZKALrcvoKPdbXnpUuo8kiXfkvnwH5aYb/nL
 6LPCOK+ICBXKAjVpeeQB/iMz/01/vmXA04ceIBAyVIMZNLNFaT5gARrlw2uGGBPVyLHDZ7gKs
 BHFPvPEmUfe+/Zclk6GvkTtF09Nws4LVaBZxjacVuj3MPcF8SHCiSdY56OFwuIJ1wZw0ACtZV
 y4hJPoq8+r/pQ6sV2OP7sxgGkCpk3/dBjMVg0AzG0FszRMdtzeXzsu7+5tRPaWQoCv6DIyZ9x
 WlAmjD89i95l62lXXoC01VWjLuEXHzw4/pMWvWbRAJuDY/0DxeE8aFDV2vNqVCj6ODNhKFZkD
 ppSmWQ==
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On my 32-bit machine,
 with BREAK_INSTR_SIZE=4 the kgdb_break[]
 structure allocates 16000 bytes of static kernel memory, which is - by default
 - to be able to handle up to 1000 concurrent kgdb breakpoi [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [212.227.17.22 listed in wl.mailspike.net]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [212.227.17.22 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [deller[at]gmx.de]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p7OLz-0001KH-LQ
X-Mailman-Approved-At: Tue, 03 Jan 2023 10:46:43 +0000
Subject: [Kgdb-bugreport] [PATCH] Reduce number of concurrent
 KGDB_MAX_BREAKPOINTS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On my 32-bit machine, with BREAK_INSTR_SIZE=4 the kgdb_break[] structure
allocates 16000 bytes of static kernel memory, which is - by default -
to be able to handle up to 1000 concurrent kgdb breakpoints.  I might be
wrong, but I doubt that in real life someone really needs that many
breakpoints, so I suggest to reduce the number of possible kgdb
breakpoints and thus reduce the memory footprint of kgdb_break[].

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 258cdde8d356..fab81c4f007e 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -95,7 +95,7 @@ extern char *dbg_get_reg(int regno, void *mem, struct pt_regs *regs);
 extern int dbg_set_reg(int regno, void *mem, struct pt_regs *regs);
 #endif
 #ifndef KGDB_MAX_BREAKPOINTS
-# define KGDB_MAX_BREAKPOINTS	1000
+# define KGDB_MAX_BREAKPOINTS	40
 #endif

 #define KGDB_HW_BREAKPOINT	1


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
