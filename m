Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C714A7BDD
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Feb 2022 00:49:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nFPN6-0005K7-Dq
	for lists+kgdb-bugreport@lfdr.de; Wed, 02 Feb 2022 23:49:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mcgrof@infradead.org>) id 1nFPN5-0005K1-0Q
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Feb 2022 23:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dcnAz8tCoaicOwm8UwBmt1xaDF3i1/7+mqYajUH4SfM=; b=LKGbmidH5dCBcHbd5rXThwouyw
 pYkzXZxUVjsdjx2BflDYNAYyQSpowykO83IhgGed8/Kxub1Oz9+aICEzjwZt8fEo2fof4oc4W1Gre
 7OII8xAxsUqa4noj8aBRinsnzBQj233CL0nClgeu/6KCJt6+YIgMS7K5MumnqCNTvpGc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dcnAz8tCoaicOwm8UwBmt1xaDF3i1/7+mqYajUH4SfM=; b=Fj+gQ8mTD/+M9gt84rB4m5efPe
 ZhjP+sT8A1kzQUDVBttC4qUUqdR0QYXWph3pchOIaZF178NUPl1KWa5fSFifdB1YjVK4EXFmHyDZk
 9iQ4DB2xqH80ga8SgFEgKO9WxSERuKf6w5cyDkMJrpOqUTprsKWE54+AEyadf9R2uWzw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nFPN2-00E5v8-KC
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Feb 2022 23:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dcnAz8tCoaicOwm8UwBmt1xaDF3i1/7+mqYajUH4SfM=; b=GlERCyG3JxZhciig/yUUTOOt7N
 qDoQxeWCdsfxJmVQC80mVru0TdX48Bwquf6XlXLN6cKFPd0tqQEtcIZ0guQ8UznK2bwgiK+aX9QyM
 tg0vhEoUE314QlaB3x2ldubznkAfUFvaqRGlBG/QV8ADLL/bR5YQyNFHFs74NZqoflXmUEB1yzFcd
 YNQmFeDMhVGvUY3iXOvG302NzsrFECQ0ifrcpwzlnD8zntWf+rWtUqZ7OHGjqOBoNDXrcjiOimMhe
 qlvny4kHhR/csemsRaASlE9jSggbTVPgM++bWyxk/ytynA8TPgRCaxKOJNPv7nsTZBYyjju9Y1DWt
 ly8Ba3tQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nFPMu-00H5lz-Mt; Wed, 02 Feb 2022 23:48:56 +0000
Date: Wed, 2 Feb 2022 15:48:56 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <YfsYaDyqrFyVypkv@bombadil.infradead.org>
References: <cover.1643475473.git.christophe.leroy@csgroup.eu>
 <230bfd896f24ca7a9281783aaa8c0ebfebd0bc7e.1643475473.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <230bfd896f24ca7a9281783aaa8c0ebfebd0bc7e.1643475473.git.christophe.leroy@csgroup.eu>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Jan 29, 2022 at 05:02:07PM +0000, Christophe Leroy
 wrote: > diff --git a/kernel/module.c b/kernel/module.c > index
 163e32e39064..11f51e17fb9f
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
X-Headers-End: 1nFPN2-00E5v8-KC
Subject: Re: [Kgdb-bugreport] [PATCH v3 3/6] modules: Introduce data_layout
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
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat, Jan 29, 2022 at 05:02:07PM +0000, Christophe Leroy wrote:
> diff --git a/kernel/module.c b/kernel/module.c
> index 163e32e39064..11f51e17fb9f 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -81,6 +81,8 @@
>  /* If this is set, the section belongs in the init part of the module */
>  #define INIT_OFFSET_MASK (1UL << (BITS_PER_LONG-1))
>  
> +#define	data_layout core_layout
> +
>  /*
>   * Mutex protects:
>   * 1) List of modules (also safely readable with preempt_disable),
> @@ -2451,7 +2454,10 @@ static void layout_sections(struct module *mod, struct load_info *info)
>  			    || s->sh_entsize != ~0UL
>  			    || module_init_layout_section(sname))
>  				continue;
> -			s->sh_entsize = get_offset(mod, &mod->core_layout.size, s, i);
> +			if (m)
> +				s->sh_entsize = get_offset(mod, &mod->data_layout.size, s, i);
> +			else
> +				s->sh_entsize = get_offset(mod, &mod->core_layout.size, s, i);
>  			pr_debug("\t%s\n", sname);

Huh why is this branching here, given you just used mod->data_layout in
all other areas?

> @@ -3468,6 +3474,8 @@ static int move_module(struct module *mod, struct load_info *info)
>  		if (shdr->sh_entsize & INIT_OFFSET_MASK)
>  			dest = mod->init_layout.base
>  				+ (shdr->sh_entsize & ~INIT_OFFSET_MASK);
> +		else if (!(shdr->sh_flags & SHF_EXECINSTR))
> +			dest = mod->data_layout.base + shdr->sh_entsize;
>  		else
>  			dest = mod->core_layout.base + shdr->sh_entsize;
>  

Likewise here.

  Luis


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
