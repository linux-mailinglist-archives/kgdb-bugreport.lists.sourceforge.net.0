Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9726D1D329
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Jan 2026 09:44:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtLzoFT4Y0fjvM0rPSi8K6nXOoq7WJ+z8xgIlpSTXbE=; b=VFajrhC6+AUGkEYY2cnvROE3XQ
	bJ9Ln4QuzP2LHG6Qh1XJmoT0VxFaPBR+g/D3bAbso0k3NHBGiA9XE9zbjaZhKltEqoFMkcz9mZKkz
	mXxz9GY8XIku+VMIZ9y1Gn+GINB9agfx9rNztUe8BFPMhgJuK5fG2UP82SF8Qp56bLNI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vfwUN-0002kR-Iz
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 14 Jan 2026 08:44:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vfwUM-0002kF-7x
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Jan 2026 08:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Nn9M/VPDoeuifL+P7no8o5FApQZk7zNKYvSR+p2CRU=; b=eefFUjKnD1dd7psHMjSCp4liLl
 u6q8hhjFdbzFvBiU6hnp/QI2L/W0VX6DNpzofiubPx3MhVKqtHs/2lOJf+cZU3bygmSu93K8Oq6uf
 YardhStegUEJ9wV3HlcTsLJwqLf4SphG3fzPFoWamVRKHYaSz58cm5gFF7RvT7g/BWlQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/Nn9M/VPDoeuifL+P7no8o5FApQZk7zNKYvSR+p2CRU=; b=KGAfEBIstKrVimTGtwIkh/NUn1
 IhbK0+CyS7rT8u1sIy2/JlV0EIao8Mh14kbSm/0ZMvokLj9W+WuJlpZOXvpLhHeyYzVGhAqChP5ID
 7BfVPICttR4X0+tQXhsXrfF4t812zUaT2tSZW9rdHxJdzSAy62m9xw9vZhrE6Ajz+1vw=;
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vfwUM-0007aE-Gr for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Jan 2026 08:44:26 +0000
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-432d2c7dd52so4502164f8f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Jan 2026 00:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768380255; x=1768985055; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/Nn9M/VPDoeuifL+P7no8o5FApQZk7zNKYvSR+p2CRU=;
 b=KBvHFB4sbkxnj3TKG1DtIl4ZiDrDC8fveqtypEMzMAjMxpw95TVJHWNveIQEg23f9V
 dgGvYiSh8QwumK7jbr6mv1ETD4EXlMlj8PK///UfFcupLoMAJFBj/8HcPGKwunYPqLS7
 6k+s79B1GP2ejLpIWPDg1JYFJ2eqRHUbk5csC6uhTy++3DbsC6REwZznde5kws1Tu8mg
 Ag23FFc2HSdOtO8678sV19wfgzWC0WSJjd65LNAHG93Lg31IlCp0oTwObg5gujbA1vYS
 ngOsIIUc/6Yh4DnT9nGvrdeGMCR/ePuVBWZqGzhhAWfaGqgAV+n4hOC9al7z3MlQN69J
 wyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768380255; x=1768985055;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Nn9M/VPDoeuifL+P7no8o5FApQZk7zNKYvSR+p2CRU=;
 b=PlCWOVH0XasXG2gXcBlDEvZgYzv4Auc9VnT69FV8gnpTUJGxh0THmk5Cg0VgjhFXL/
 FNkMX8O6IKHixl+fKdQYdi0P/e5fg2EumkYoWDdQL7JJGxnbNwdQ7xTdxw6xh9e5vjT8
 JjcBEZahJ/etqkEB+WLsQNF6pd9A8lRYmI2e250JEPh7iO2j1J5a0IhaD7yHO7aB6pyr
 aeybucuMiaPXXVWWB6BWETOlkePk9cxs86DtKJwLDx+T6kCg+srFEIAKK49aF1ik/WCK
 ZXNpngZzCzNTpYT+Y4FuQngzQpTPExsm1ueeovVBNX9TuJdYVLa9pwEk8hFXMHmtDJG3
 cbNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTf4iVt3G1NHSGRmYCDz53FJ7g4ZXkzgTnRLv/dvDdgS/4dqo4/TMRrMD8PKWzy0Z4F2pTeW3P/Y22gr97Sw==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxJLHWdw0MjrSmXOqLDxSJaWZVyHT3okOSMUBPPZGJlfgjMWl4A
 W9P/0Hhe2LnA4G1oan8CW6Lj8VdR3F5TdspnYkZYxVUYK0d+I6fz9PPT6UvpP62b1uQ=
X-Gm-Gg: AY/fxX4D+hCVVeIS7+THysbQhWHk1r7rDpA0M0pbIgTLBhq+WQGJIF9cATusuPoxDez
 LwOnZudWG/b9v0T90jWNKap3YIqrFphjfAyzGfZI2ynd4kFujDstreSSsl7C2veENpBXB2O9w2H
 wLxdpQ9URJJBo687NdTgYLmoKAKsBvaN6eu7WpT3hoM/+aOYjggleoYGlhhYkF2/a/1+f3S22Ks
 k5dEniJp3z7a2eElD1f0mdM22Bkwqr1qikhMdrCTDRQa1JfK7ar9Sw3MwTukACvncuGHLx6Oa8K
 5+4JQMK/0LO4VvevSanTIinUxBKhPkIh5EZruDUKslbrn5xQ0F85qnXz/yeIiG9dJnnJ0XbC0vl
 MXFk2wCejen/VRg//qztq9CXhJwLS7cY+EwphclwwiWMRWeT4Az5zWsPpXA2bWVjtnHlX2aE+jj
 a8bw3U/r7C5eqEfg==
X-Received: by 2002:a05:6000:61e:b0:431:a38:c2f7 with SMTP id
 ffacd0b85a97d-4342c574bedmr1500621f8f.59.1768380254886; 
 Wed, 14 Jan 2026 00:44:14 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ee5e3sm48685590f8f.35.2026.01.14.00.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 00:44:14 -0800 (PST)
Date: Wed, 14 Jan 2026 09:44:11 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWdXW6ohfQ7_z2B_@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-3-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-3-21a291bcf197@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat 2025-12-27 09:16:10, Marcos Paulo de Souza wrote: >
 The flags argument was also used to check if CON_NBCON was set, but their
 > usage was fixed in the last commit. All current users are reading [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.51 listed in wl.mailspike.net]
X-Headers-End: 1vfwUM-0007aE-Gr
Subject: Re: [Kgdb-bugreport] [PATCH 03/19] printk: Drop flags argument from
 console_is_usable
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Andreas Larsson <andreas@gaisler.com>, Kees Cook <kees@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Shan-Chun Hung <schung@nuvoton.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Breno Leitao <leitao@debian.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, sparclinux@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Richard Weinberger <richard@nod.at>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Daniel Thompson <danielt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jacky Huang <ychuang3@nuvoton.com>, John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org,
 Nicholas Piggin <npiggin@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat 2025-12-27 09:16:10, Marcos Paulo de Souza wrote:
> The flags argument was also used to check if CON_NBCON was set, but their
> usage was fixed in the last commit. All current users are reading the
> variable just to call console_is_usable.
> 
> By calling console_srcu_read_flags inside console_is_usable makes the
> code cleaner and removes one argument from the function.
> 
> Along with it, create a variant called __console_is_usable that can be
> used under console_list_lock(), like unregister_console_locked.
> 
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -656,13 +656,8 @@ extern bool nbcon_kdb_try_acquire(struct console *con,
>  				  struct nbcon_write_context *wctxt);
>  extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
>  
> -/*
> - * Check if the given console is currently capable and allowed to print
> - * records. Note that this function does not consider the current context,
> - * which can also play a role in deciding if @con can be used to print
> - * records.
> - */
> -static inline bool console_is_usable(struct console *con, short flags,
> +/* Variant of console_is_usable() when the console_list_lock is held. */

Nit: The comment is a bit misleading because this function is called
     also from console_is_usable() under console_srcu_read_lock().

     I would say something like:

/*
 * The caller must ensure that @con can't disappear either by taking
 * console_list_lock() or console_srcu_read_lock(). See also
 * console_is_usable().
 */
> +static inline bool __console_is_usable(struct console *con, short flags,
>  				     enum nbcon_write_cb nwc)
>  {
>  	if (!(flags & CON_ENABLED))
> @@ -707,6 +702,18 @@ static inline bool console_is_usable(struct console *con, short flags,
>  	return true;
>  }
>  
> +/*
> + * Check if the given console is currently capable and allowed to print
> + * records. Note that this function does not consider the current context,
> + * which can also play a role in deciding if @con can be used to print
> + * records.

And I would add here something like:

 *
 * Context: Must be called under console_srcu_read_lock().

> + */
> +static inline bool console_is_usable(struct console *con,
> +				     enum nbcon_write_cb nwc)
> +{
> +	return __console_is_usable(con, console_srcu_read_flags(con), nwc);
> +}
> +
>  #else
>  static inline void nbcon_cpu_emergency_enter(void) { }
>  static inline void nbcon_cpu_emergency_exit(void) { }

Otherwise, it looks good. It is a nice clean up.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
