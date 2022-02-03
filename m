Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A77F4A7C2E
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Feb 2022 01:02:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nFPZj-0000Ob-8s
	for lists+kgdb-bugreport@lfdr.de; Thu, 03 Feb 2022 00:02:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mcgrof@infradead.org>) id 1nFPZh-0000OV-GP
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Feb 2022 00:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yI1c1Z9vXRpl2FDXC3ecyHJ59PiRNE8pG+XB1IRwy/4=; b=kEL8jhIcfpcVExIpxC4nXbRZ5m
 AYuXmHjdgPAk70vyUgGmp6kCbSTAE9HAgyIzc6B/gQRhmKaw1S5AKJpbYItMy01XMkvt/wWc05jXI
 k8copf+aLbC0JUKsegy2uRfp08IDSrFWQ9CZiiD9DFIOD+RXyWZX9E+cJzV7FoA3UwEE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yI1c1Z9vXRpl2FDXC3ecyHJ59PiRNE8pG+XB1IRwy/4=; b=d5zJfWDpr7uskYBY3Yqm02I4iI
 H3glOVI7osYdiq1YAQTcRdSHWJ/BPrf5BupxpXNrFnF9X13ymGnPEPSnN6xxh3HJQAl/cCWo+hdvz
 pozT1J63HlHNA1Z6zABdmUpsgO6s+ujrfh5cNRycARB9XJOgzDi0UJaBnrmQOKPpa6jg=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nFPZf-0008UE-A9
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Feb 2022 00:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yI1c1Z9vXRpl2FDXC3ecyHJ59PiRNE8pG+XB1IRwy/4=; b=TQZ8uehuc4i6CSbxxV4Hj0ILbQ
 uw3bCU6M7RsrnOZIOmmsp709oeCm+Z3nSsimNrWc3/oRZyW22osgVtdoOaTvrbfscuQGVFuMM60Ii
 6qOHhYip+BMTiTYm2hdkuT5e6WmD1I6Q0CLllhHc+vnOoIpcY/XqjE574FMPPOtKGugT46xA16OnN
 0EsxAWAEGTMJknLtKflVSgCGEncWI+ZgffS/Wfsr3V0a8q5rD3jwnQXAiKHiLKoBFi35OGfjjXoBF
 bQ/GbSwbWC5tgN0wkF0k0e5TXQoD60mH38j7QsTCYxZke4Fk4ICP+k1NFqJrS6vX6yNuGjtW1W6VN
 J1Z+D4Gg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nFPZR-00H7Rx-NH; Thu, 03 Feb 2022 00:01:53 +0000
Date: Wed, 2 Feb 2022 16:01:53 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Aaron Tomlin <atomlin@redhat.com>
Message-ID: <YfsbcXD74BwJ9ci2@bombadil.infradead.org>
References: <cover.1643475473.git.christophe.leroy@csgroup.eu>
 <b59ed8781ef9af995c5bfa762de1f42fdfc57c74.1643475473.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b59ed8781ef9af995c5bfa762de1f42fdfc57c74.1643475473.git.christophe.leroy@csgroup.eu>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Jan 29, 2022 at 05:02:09PM +0000, Christophe Leroy
 wrote: > diff --git a/kernel/module.c b/kernel/module.c > index
 11f51e17fb9f..f3758115ebaa
 100644 > --- a/kernel/module.c > +++ b/kernel/modu [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nFPZf-0008UE-A9
Subject: Re: [Kgdb-bugreport] [PATCH v3 4/6] modules: Add
 CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 Jason Wessel <jason.wessel@windriver.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat, Jan 29, 2022 at 05:02:09PM +0000, Christophe Leroy wrote:
> diff --git a/kernel/module.c b/kernel/module.c
> index 11f51e17fb9f..f3758115ebaa 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -81,7 +81,9 @@
>  /* If this is set, the section belongs in the init part of the module */
>  #define INIT_OFFSET_MASK (1UL << (BITS_PER_LONG-1))
>  
> +#ifndef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
>  #define	data_layout core_layout
> +#endif
>  
>  /*
>   * Mutex protects:
> @@ -111,6 +113,12 @@ static struct mod_tree_root {
>  #define module_addr_min mod_tree.addr_min
>  #define module_addr_max mod_tree.addr_max
>  
> +#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> +static struct mod_tree_root mod_data_tree __cacheline_aligned = {
> +	.addr_min = -1UL,
> +};
> +#endif
> +
>  #ifdef CONFIG_MODULES_TREE_LOOKUP
>  
>  /*
> @@ -186,6 +194,11 @@ static void mod_tree_insert(struct module *mod)
>  	__mod_tree_insert(&mod->core_layout.mtn, &mod_tree);
>  	if (mod->init_layout.size)
>  		__mod_tree_insert(&mod->init_layout.mtn, &mod_tree);
> +
> +#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> +	mod->data_layout.mtn.mod = mod;
> +	__mod_tree_insert(&mod->data_layout.mtn, &mod_data_tree);
> +#endif


kernel/ directory has quite a few files, module.c is the second to
largest file, and it has tons of stuff. Aaron is doing work to
split things out to make code easier to read and so that its easier
to review changes. See:

https://lkml.kernel.org/r/20220130213214.1042497-1-atomlin@redhat.com

I think this is a good patch example which could benefit from that work.
So I'd much prefer to see that work go in first than this, so to see if
we can make the below changes more compartamentalized.

Curious, how much testing has been put into this series?

  Luis


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
