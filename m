Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B87BD2F2B2
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 16 Jan 2026 11:00:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sU9vB+nN0ECwefrv6cd3Vm+ij5h1zXjkNQKdKAcxpNo=; b=j6qMjqgzaYrO6NSRtUiN0om7fR
	H+p7FUrfbmjVeziqA+HOHjMWi0aCOqme55W+ArgJ3BkrHHm0RJKciZkarUHcFcP5KoJqazM9qBgFr
	U6v12uuhzLETlZACXmScK8XiYvuU2CZd/0YZen3r8qFBS3h7/W64TwLsKJBJZap07k4M=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vggco-00047b-CO
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 16 Jan 2026 10:00:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vggcn-00047T-Ff
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 16 Jan 2026 10:00:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ik7nBSUvqjiZji8p0UMpcxyJ9CmKYvj/STnQwZRmw6o=; b=YDx9wUM0gzSgnYA3RYZaNzBq6U
 ZnyOfkJp87aEQOgjfeOujXuuxbOjkYoP1bWBV2l253OSL4ayo+dOizl+1OpH6Hxq4yJkX0saNwjpD
 IPUkbD86AG6gs4CReqhs9Phsfj5ZC5BjNVLH9ZqoikKBRl97QH2djudAsV6O/Ppxz6xc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ik7nBSUvqjiZji8p0UMpcxyJ9CmKYvj/STnQwZRmw6o=; b=HMRxwlfCrL/cuPc7fO7ep+z31R
 JtBed8BVNt8bVCXSDltaSZ4ir8VuXwbH/0P+Pb5DNBu3nSyO1nBx6KIqh9lvBLT5HFa1x8b0r29z4
 c0ubyp6J1B9vIEe+8HNRpQfTpNSK3Hjk56uwLUuglr6zoM9r7R4J0Wn2Mmzy/XDvCfsM=;
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vggcm-0004yV-Rz for kgdb-bugreport@lists.sourceforge.net;
 Fri, 16 Jan 2026 10:00:14 +0000
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-42fbc305914so1361865f8f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 16 Jan 2026 02:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768557601; x=1769162401; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ik7nBSUvqjiZji8p0UMpcxyJ9CmKYvj/STnQwZRmw6o=;
 b=Pcpo1J2yFa70cCM7/39jGwvL2+UZWPBPHcDWlVkAyk7kAYFVpozuXnmfykItW4yafk
 7zL3YB3zhUJcg6kfiToaSTq4UU71bX/jkEtc9XQAhim0cveWNHdXrqRahLljmaeTMq7v
 vwa/MCsFwsFwdM9H+/cuqjoThKa6pB3dIsJwH01rEc8BL7pDwFajjVBTH3tJiN+tfiWP
 csUtJPIZOLzbf6l574HLoNyePKBIoqLT0iIapbpYf3vJzaP7S/pzhyEfVpR21sz4tAxd
 5evt0yJzIumHmYhmCi3cpv7Zj0uadnqO/4SLO4rRJa8lvzSNzRMAu5VAlyKBJXtRK9l6
 O9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768557601; x=1769162401;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ik7nBSUvqjiZji8p0UMpcxyJ9CmKYvj/STnQwZRmw6o=;
 b=ZjacIXnLVtw/lqVahVpYnCknfVxuahjM8wDB6wu6CFG6xvV0Z7/Ke8N0fjwMixbM62
 7Q+QU4r+R4I06Ad/TyNqNUTn7+SxPodiUYZg1nEym8RbbDG5+SbRFq1I0Gf3Pfl69tZm
 6Pw818RGj0wCDFiwY81suG2N5rhpTQk0iNqP9H9v2iyNd0nr0wZ/qLvSVU2OO/JfRxJz
 pRM+xnAovYrVdes6g0cq2iY1jWh8jkkkpaCdN7A5Wg7Fxl6+TKivk9dMYRtfkFTMrnKi
 Aj50wT9SrZgky50FxXfAho3aaJtJkGR9O6Zr2K6QOroCAH+CoJmkXofDXMvlUYEXpjt5
 PRcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5FdUtzBHrzTx+JwuNaEGJ4dQ2qnYCvpOI27r75Uy4dXLQ7RRQFeUgHQHT+TS1kFBSGtTo4MrfiUuiP+ppOA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxLdtHOd3boKMuLZdANbNYEwS1ZQTOfa+Ct5JERSXkg1q9RTCBn
 S9J2lWH3vO3Qp2dX+3Qv6ryu8LMUgXCKP8w+wu9JMxesioXVXqXld9539ckIt+pCb2A=
X-Gm-Gg: AY/fxX71RYLJdiTjHm+WMCS6NJcxifCze5wROD7ivLuAXC+4X3ZI3NsGZax6hiaJd0A
 j/ZDZMIqSFQoANVMGGHvxm/ipWWFZVG5jK4NtroDT3lcglvRak1i0j8PHx2QyC7m7/FlUlHgmZX
 cvPqVjkELsFkzJNG/gMbjsAqwhIvX43LQdEh4aSklxIYSUNrfnlnHaA71Ys78nBFbtvv/t8gU96
 IjNmVx+/u1+ujuqzuxKb2QZnNFIg7eyCCnVRwdwxzGlKjrCyQrl/uPTuTG6AlHjHs2sV0g78ArT
 TBFwX5RlAGb+kH/LtjgEy7Ca1zgEHbRwMI9iTrgLrCuKM83OZlxmyMF+Jex/cCHWgO/MKIs9Wxe
 5I3qzZoX1ig941ZnqetaeanUM1sUbjakv5KiNrOTAaVeNV9+QRBnCpkxJDhiBZjrS46V1fHm3ZF
 yNSZYfSd1po/+W+g==
X-Received: by 2002:a05:6000:26ce:b0:432:dfea:1fa8 with SMTP id
 ffacd0b85a97d-43569bc5767mr3019291f8f.45.1768557601174; 
 Fri, 16 Jan 2026 02:00:01 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569921f6esm4337797f8f.4.2026.01.16.01.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 02:00:00 -0800 (PST)
Date: Fri, 16 Jan 2026 10:59:57 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWoMHbbn-BmmbZMg@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-15-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-15-21a291bcf197@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat 2025-12-27 09:16:22, Marcos Paulo de Souza wrote: >
 The register_console_force function was introduced to register consoles >
 even on the presence of default consoles, replacing the CON_ENABLE [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.53 listed in wl.mailspike.net]
X-Headers-End: 1vggcm-0004yV-Rz
Subject: Re: [Kgdb-bugreport] [PATCH 15/19] drivers: tty: serial: mux.c:
 Migrate to register_console_force helper
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

On Sat 2025-12-27 09:16:22, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> --- a/drivers/tty/serial/mux.c
> +++ b/drivers/tty/serial/mux.c
> @@ -390,7 +390,7 @@ static struct console mux_console = {
>  	.write =	mux_console_write,
>  	.device =	uart_console_device,
>  	.setup =	mux_console_setup,
> -	.flags =	CON_ENABLED | CON_PRINTBUFFER,
> +	.flags =	CON_PRINTBUFFER,
>  	.index =	0,
>  	.data =		&mux_driver,
>  };
> @@ -547,7 +547,7 @@ static int __init mux_init(void)
>  		mod_timer(&mux_timer, jiffies + MUX_POLL_DELAY);
>  
>  #ifdef CONFIG_SERIAL_MUX_CONSOLE
> -	        register_console(&mux_console);
> +		register_console_force(&mux_console);

The situation here is the same as in 16th patch for
ma35d1serial_console().

Also "mux_console" is assigned to

static int __init mux_probe(struct parisc_device *dev)
{
[...]
		mux_driver.cons = MUX_CONSOLE;

		status = uart_register_driver(&mux_driver);
[...]
		status = uart_add_one_port(&mux_driver, port);
[...]
}

So, that it can get registered also by:

  + mux_probe()
    + uart_add_one_port()
      + serial_ctrl_register_port()
	+ serial_core_register_port()
	  + serial_core_add_one_port()
	    + uart_configure_port()
	      + register_console()

And we would need to pass the "force" information via CON_FORCE flag.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
