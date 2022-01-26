Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B7E49D498
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 26 Jan 2022 22:36:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nCpxz-0002ri-SY
	for lists+kgdb-bugreport@lfdr.de; Wed, 26 Jan 2022 21:36:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rppt@kernel.org>) id 1nCpxy-0002rX-5p
 for kgdb-bugreport@lists.sourceforge.net; Wed, 26 Jan 2022 21:36:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ADHCEsCRqt0o9gUuVsAuuowBfbgEmZzzBQyUYQq7JI4=; b=VQh+XPs3cDh6GackDzwrnEToJ9
 KKDqxVOS5tqlvAkG8k1gqTxOrJ09UDfzVE29HfYiG7kdFchc6CHtEY4upjqOVYC2qOGInB7KCDIsg
 t+y+vlGz2Q25WGRvcGaCzyMFOu9Hcpr+K3Kb4VcJJEO/Maaw5AyqHfhEH40rNZZKeKnE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ADHCEsCRqt0o9gUuVsAuuowBfbgEmZzzBQyUYQq7JI4=; b=Ku/x/Ga0APdTl8etMx9qVTA5db
 EEb0/MA4COtGYFU06ARPtXIDPh0mkWjTXUcOZ3EnMwDNpqFgaMZTnmaFocnm31j7WvW5Ak/OhWDt5
 VxBAeFVh7SrDZV3cdLrGrMM/7mOVu/L7suB2jdn+5Qmip5SX+b1vAgrTV5pUdml70CVU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nCpxw-0000Ev-DQ
 for kgdb-bugreport@lists.sourceforge.net; Wed, 26 Jan 2022 21:36:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9659561926;
 Wed, 26 Jan 2022 21:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F23C340E8;
 Wed, 26 Jan 2022 21:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643232984;
 bh=qiDwOHAZZYgzMESTLY09sncGjaRqe3P7WUyD63U80QA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F5N5X4tFYnAPtsQXZdHMR/zZCc9G6WRuaXBfK+Ty5IM/QMwMOdyliX4LBQzikYCRA
 EbxPUMzlBLq5kxn2Lp0cw6skBSXxq8XEgVuf6+lujnGG1XDj3L51N6//5M6Y3QrjOh
 Qjjsvo6HAyuhIFv50e2OCI+NPAASzuQaMml82XCScDEM2tNfWJ8JjwQ0gEcih7/MNY
 JNESyI5BmHohYobkVSEHNReqMQ9KBlDKprBjI8o+gcDWHjkFEduTZaWXpcnWDLvcXp
 mXoALrN0E1bm7oyRxjSzeBe/lgpnyZM+LvvX9slVLLDeANjKEhkqhZJe9x6IunDd7F
 UbXGnOxc8kq6g==
Date: Wed, 26 Jan 2022 23:36:13 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <YfG+zVl8aV+UszoE@kernel.org>
References: <cover.1643015752.git.christophe.leroy@csgroup.eu>
 <e5e58875bd15551d0386552d3f9fa9ee8bc183a2.1643015752.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5e58875bd15551d0386552d3f9fa9ee8bc183a2.1643015752.git.christophe.leroy@csgroup.eu>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 24, 2022 at 09:22:15AM +0000, Christophe Leroy
 wrote: > within_module_core() and within_module_init() are doing the exact
 same > test, one on core_layout, the second on init_layout. > > In [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nCpxw-0000Ev-DQ
Subject: Re: [Kgdb-bugreport] [PATCH 1/7] modules: Refactor
 within_module_core() and within_module_init()
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jan 24, 2022 at 09:22:15AM +0000, Christophe Leroy wrote:
> within_module_core() and within_module_init() are doing the exact same
> test, one on core_layout, the second on init_layout.
> 
> In preparation of increasing the complexity of that verification,
> refactor it into a single function called within_module_layout().
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  include/linux/module.h | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/module.h b/include/linux/module.h
> index c9f1200b2312..33b4db8f5ca5 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -565,18 +565,27 @@ bool __is_module_percpu_address(unsigned long addr, unsigned long *can_addr);
>  bool is_module_percpu_address(unsigned long addr);
>  bool is_module_text_address(unsigned long addr);
>  
> +static inline bool within_range(unsigned long addr, void *base, unsigned int size)
> +{
> +	return addr >= (unsigned long)base && addr < (unsigned long)base + size;
> +}

There's also 'within' at least in arch/x86/mm/pat/set_memory.c and surely
tons of open-coded "address within" code.

Should it live in, say, include/linux/range.h?

> +
> +static inline bool within_module_layout(unsigned long addr,
> +					const struct module_layout *layout)
> +{
> +	return within_range(addr, layout->base, layout->size);
> +}
> +
>  static inline bool within_module_core(unsigned long addr,
>  				      const struct module *mod)
>  {
> -	return (unsigned long)mod->core_layout.base <= addr &&
> -	       addr < (unsigned long)mod->core_layout.base + mod->core_layout.size;
> +	return within_module_layout(addr, &mod->core_layout);
>  }
>  
>  static inline bool within_module_init(unsigned long addr,
>  				      const struct module *mod)
>  {
> -	return (unsigned long)mod->init_layout.base <= addr &&
> -	       addr < (unsigned long)mod->init_layout.base + mod->init_layout.size;
> +	return within_module_layout(addr, &mod->init_layout);
>  }
>  
>  static inline bool within_module(unsigned long addr, const struct module *mod)
> -- 
> 2.33.1
> 

-- 
Sincerely yours,
Mike.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
