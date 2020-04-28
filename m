Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D94031BC051
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 Apr 2020 15:55:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jTQhc-0001PK-LQ
	for lists+kgdb-bugreport@lfdr.de; Tue, 28 Apr 2020 13:55:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jTQha-0001P8-Kf
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 13:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y4R3VnlEi2z5e9sIaP90X1Xt8ogqQzWAFd5IDdJculE=; b=nHgsq8AiZ80SeQxIevyjFu1QND
 vCJAKBJkHVB8VshMqyB/RpoW5qzBDtGOKd4LI2jWgcveMgaW8yfT34KlxFLBnb57saS99HUWbrSFD
 PgfgpQUQvNsetjCeyNzLHYwg3FLGk4/khraV39e8hTI8YoPCQR7br2qaqv6M40GmL5Rc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y4R3VnlEi2z5e9sIaP90X1Xt8ogqQzWAFd5IDdJculE=; b=MZZvs5fQB6KqKkuRWnpYzz27V4
 Y0o4BrX7+n8szjNHPtLqa0iTFA952t99UQJPGzVQvVpv0j2/CjU+kZg/rEGJ2OxjNAa3YHypI8xeq
 d0ceRBA27RjTvhDEtY2mgWkGgHD6LSe5tzFu6dulvf67Hjd0nx79Nt7lE4Q8Otwq0bp4=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jTQhU-000pI2-Rs
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 13:55:10 +0000
Received: by mail-wr1-f65.google.com with SMTP id j2so24761094wrs.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 28 Apr 2020 06:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=y4R3VnlEi2z5e9sIaP90X1Xt8ogqQzWAFd5IDdJculE=;
 b=JJM3sOrRHFZiVfnWGdSakzblHcv7JX3BvvX2/h97d8aeprfJN//zyI26TJIp+jtPY/
 4HrFhR9QrEYH/p29K7RIUSoJD1T2OjM2lOFlOMnu//pAHmVUeH7A2eAAsKNYpO9ueAs2
 4fPfQ8vAiUAjgVg/2Jmw82zkQUuPHpMlOUmxJV1bH+cU4i399cjjXdoFdq3pFPmYUx1T
 vT7vGj3l1YiC3xMJUfq9baoMdoKeUm4a421T8WL45h90URhKfiBrzFOZmSodBEo3ITRd
 TvHpZAOX9Bj7TlhU21ea3qZG4n6hRRWDiHFWfDAier17llPtDdbRVBJmUbFwPStooCFh
 /dZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y4R3VnlEi2z5e9sIaP90X1Xt8ogqQzWAFd5IDdJculE=;
 b=qlMPP0sN81HyRyoWUm/W4Rj+zX+jjkGU7hKQFI4TlIfH07h1+Oe8+ewsn0QzZ2+3Vd
 9fIjBrTEaJrFO0OXDsNb6z9mme/kLnMkkqWgs5962fRF5w8RdvgPEAV7PQ6tvUx5dcaD
 fR9nbEXFLXp9EOWjK2uiAQqP0x9dR0h024K+yMvzEG6qoaF+9AaIFCOQDxa6jMwHwR4Q
 bRRhUqfNHO/0nGWofTIeyWM1CPkI1sIjmgJVfBjHJmPfs+wnZKBaQBNWLjYP+xtfkoET
 IRRZDrmZBrCdnnAq0cBSjJhZwihjCQquIxQl3Eiczv+RP3Tj+6L1QG6+Dw9P9zW5PEN4
 r1PA==
X-Gm-Message-State: AGi0PuZAPES8PLfdqO8o89uszyiJZY3u4OkoIEMJFVjyT0+QAKV0/2BQ
 6V09mM28dQnKTdsNg3rduWXOFw==
X-Google-Smtp-Source: APiQypIgyNgC6uyVKLvHFUkGnGak2AElpTZPwJhrf3lsXoErO6m8fGbfE7BWOG5yBnFfbrAITeMsxQ==
X-Received: by 2002:adf:e586:: with SMTP id l6mr32840757wrm.184.1588082098287; 
 Tue, 28 Apr 2020 06:54:58 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id d143sm3330771wmd.16.2020.04.28.06.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 06:54:57 -0700 (PDT)
Date: Tue, 28 Apr 2020 14:54:56 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200428135456.2d7zxz2mdte5kclk@holly.lan>
References: <1587716031-28199-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587716031-28199-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jTQhU-000pI2-Rs
Subject: Re: [Kgdb-bugreport] [PATCH] serial: amba-pl011: Support
 earlycon_kgdboc
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
Cc: gregkh@linuxfoundation.org, jslaby@suse.com, linux@armlinux.org.uk,
 linux-serial@vger.kernel.org, jason.wessel@windriver.com,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Apr 24, 2020 at 01:43:51PM +0530, Sumit Garg wrote:
> Implement the read() function in the early console driver. With
> recently added earlycon_kgdboc feature, this allows you to use kgdb
> to debug fairly early into the system boot.
> 
> We only bother implementing this if polling is enabled since kgdb can't
> be enabled without that.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
> 
> Depends on kgdb patch series: https://lkml.org/lkml/2020/4/21/1179
> 
>  drivers/tty/serial/amba-pl011.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
> index 2296bb0..c010f63 100644
> --- a/drivers/tty/serial/amba-pl011.c
> +++ b/drivers/tty/serial/amba-pl011.c
> @@ -2435,6 +2435,37 @@ static void pl011_early_write(struct console *con, const char *s, unsigned n)
>  	uart_console_write(&dev->port, s, n, pl011_putc);
>  }
>  
> +#ifdef CONFIG_CONSOLE_POLL
> +static int pl011_getc(struct uart_port *port)
> +{
> +	if (readl(port->membase + UART01x_FR) & UART01x_FR_RXFE)
> +		return NO_POLL_CHAR;
> +
> +	if (port->iotype == UPIO_MEM32)
> +		return readl(port->membase + UART01x_DR);
> +	else
> +		return readb(port->membase + UART01x_DR);
> +}
> +
> +static int pl011_early_read(struct console *con, char *s, unsigned int n)
> +{
> +	struct earlycon_device *dev = con->data;
> +	int ch, num_read = 0;
> +
> +	while (num_read < n) {
> +		ch = pl011_getc(&dev->port);
> +		if (ch == NO_POLL_CHAR)
> +			break;
> +
> +		s[num_read++] = ch;
> +	}
> +
> +	return num_read;
> +}
> +#else
> +#define pl011_early_read NULL
> +#endif
> +
>  /*
>   * On non-ACPI systems, earlycon is enabled by specifying
>   * "earlycon=pl011,<address>" on the kernel command line.
> @@ -2454,6 +2485,7 @@ static int __init pl011_early_console_setup(struct earlycon_device *device,
>  		return -ENODEV;
>  
>  	device->con->write = pl011_early_write;
> +	device->con->read = pl011_early_read;
>  
>  	return 0;
>  }
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
