Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E995037F88F
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 13 May 2021 15:19:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lhBFk-00074x-Pj
	for lists+kgdb-bugreport@lfdr.de; Thu, 13 May 2021 13:19:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <SRS0=DCOd=KI=goodmis.org=rostedt@kernel.org>)
 id 1lhBFj-00074q-GS
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 May 2021 13:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4/8TnP0gMqFoWzxeFO9kEhdXYpxNxdYKz2zAPhu3gbw=; b=KV5sz8R4x83L4eTbCM0axTVeCb
 +lk4ag56BhBKFYImXYaVs9nYH6+K8klnUNrznXOirT9BZT0tISyaicu5ap9iePVoQ0M6acMHjEsK8
 9gO15S/YViL/gk4ZGDEv6AqJcRdYz9pu9x6h6eeE7e6RD846cfHa0fafJcXwPghQ09xk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4/8TnP0gMqFoWzxeFO9kEhdXYpxNxdYKz2zAPhu3gbw=; b=kSyQfP54ijAI9K7k7J+GKb2eQO
 chqGxVSlxwmsErn0EZDMmu9N2vBDHSPufIY+YF3oRAsfCNrY5yB4u++43Ya/UKxm8cEmUplMyZ8XB
 mU+hFrkEFO8XGmlMzRKwLAPBN+1ayPqz2Eq/X0iuqSVeVkNxAjPmG4H8pbiVhik3i510=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lhBFe-006kq6-P3
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 May 2021 13:19:49 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A083C61433;
 Thu, 13 May 2021 13:19:36 +0000 (UTC)
Date: Thu, 13 May 2021 09:19:35 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20210513091935.5747c12e@gandalf.local.home>
In-Reply-To: <20210513112842.707103-2-sumit.garg@linaro.org>
References: <20210513112842.707103-1-sumit.garg@linaro.org>
 <20210513112842.707103-2-sumit.garg@linaro.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lhBFe-006kq6-P3
Subject: Re: [Kgdb-bugreport] [PATCH v3 1/2] kdb: Get rid of redundant
 kdb_register_flags()
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
Cc: daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, mingo@redhat.com, jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, 13 May 2021 16:58:41 +0530
Sumit Garg <sumit.garg@linaro.org> wrote:

> Commit e4f291b3f7bb ("kdb: Simplify kdb commands registration")
> allowed registration of pre-allocated kdb commands with pointer to
> struct kdbtab_t. Lets switch other users as well to register pre-
> allocated kdb commands via:
> - Changing prototype for kdb_register() to pass a pointer to struct
>   kdbtab_t instead.
> - Embed kdbtab_t structure in defcmd_set rather than individual params.
>   So while at it rename struct defcmd_set to struct kdb_macro_t as that
>   sounds more appropriate given its purpose.
> 
> With these changes kdb_register_flags() becomes redundant and hence
> removed. Also, since we have switched all users to register
> pre-allocated commands, "is_dynamic" flag in struct kdbtab_t becomes
> redundant and hence removed as well.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  include/linux/kdb.h            |  27 +++--
>  kernel/debug/kdb/kdb_main.c    | 206 +++++++++++----------------------
>  kernel/debug/kdb/kdb_private.h |  13 ---
>  kernel/trace/trace_kdb.c       |  12 +-

For the tracing directory.

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve

>  samples/kdb/kdb_hello.c        |  20 ++--
>  5 files changed, 104 insertions(+), 174 deletions(-)



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
