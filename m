Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD876C69C8
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 23 Mar 2023 14:45:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pfLFq-0006Eq-RV
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 23 Mar 2023 13:45:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <johan@kernel.org>) id 1pZZk5-00050w-1K
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 07 Mar 2023 16:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a5xHbrPVEM0zFxA1jbZIjhfjjxtJP00Wyme1dYOW95M=; b=S1NVArOmc9acH6zlDsoRHIs7ar
 KQFU+b2vJDU00JYD4cb5xPOYn8eBNbKfh8qSK01uHbxE9TqtHg7SF5wcx4GYPqGN7bq06HBQL73nS
 soN2k9CKbTkFlP0O5Tgkdp188tzISOwmNh8kj231ebNWw18V63jSLl5eznILFXidcbM0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a5xHbrPVEM0zFxA1jbZIjhfjjxtJP00Wyme1dYOW95M=; b=nPf1Xcn/ZtEsoCI0dGUte2cmvT
 aCX0i6y+YRhJ5q5MoREocZ2ynl93M17n1sWva1N0aKK9JNnXdLetYE5H4N/hWrbjztmF+O5m760Bd
 yyKssho0YdA+gROeg80xI54fh0mjugvQriebgycc2Qu97yFQ44Tf+/axMVxvzkPA/KFU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pZZk1-002KiR-WF for kgdb-bugreport@lists.sourceforge.net;
 Tue, 07 Mar 2023 16:00:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A159DCE1B9A;
 Tue,  7 Mar 2023 16:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A69C433EF;
 Tue,  7 Mar 2023 16:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678204833;
 bh=XELSBi6E3+FbM/LiXAELFwCSOKXenhaobdNpjoZaK00=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XzCfG+RbhV7fm4X9jGeuuYZ7Dwg/nLxgYz3b192FZwW0x7HfiQxE67RBV3apXnLsc
 GmEZPntEaMxS1mHW1UiRtDnCD/+YdcgjHNM8UXEcNId/Tm75RtRwyEJx4Q8vcjU9Z8
 6ZPFwQU/PcaPr0DZuEK11FbgDf7ubX5YuF+qQ0eGGEK6ggoR00RhVZE5tjgNHc8MO9
 qL6U91zjPS5wYLBx6WdbtJdmthaakLZVWCK1PyoOAVO/JRv69gjqTuwoFp9/Vy2dxR
 knYGWBBgk2fbrb3R8hBFSea/pw0ZOCqnlQEtb04UQm0YJ13k3pfptTx/Tv+Z3qLPXy
 sk8V98dtkyISA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pZZka-0000Od-JP; Tue, 07 Mar 2023 17:01:16 +0100
Date: Tue, 7 Mar 2023 17:01:16 +0100
From: Johan Hovold <johan@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZAdfzHnRtBtcDbKK@hovoldconsulting.com>
References: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 07, 2023 at 07:32:11AM -0800, Douglas Anderson
 wrote: > Commit d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations
 > in progress at shutdown") was basically a straight revert of [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pZZk1-002KiR-WF
X-Mailman-Approved-At: Thu, 23 Mar 2023 13:45:23 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 1/3] tty: serial: qcom-geni-serial: Fix
 kdb/kgdb after port shutdown (again)
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-serial@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Mar 07, 2023 at 07:32:11AM -0800, Douglas Anderson wrote:
> Commit d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations
> in progress at shutdown") was basically a straight revert of the
> commit it claims to fix without any explanation of why the problems
> talked about in the original patch were no longer relevant. Indeed,
> commit d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations
> in progress at shutdown") re-introduces the same problem that commit
> e83766334f96 ("tty: serial: qcom_geni_serial: No need to stop tx/rx on
> UART shutdown") fixed.
> 
> The problems are very easy to see by simply doing this on a
> sc7180-based Chromebook:
> 
> 1. Boot in developer mode with serial console enabled and kdb setup on
>    the serial console.
> 2. via ssh: stop console-ttyMSM0; echo g > /proc/sysrq-trigger
> 
> When you do the above you'll see the "kdb" prompt printed on the
> serial console but be unable to interact with it.
> 
> Let's fix the problem again by noting that the console port is never
> configured in DMA mode and thus we don't need to stop things for the
> console.
> 
> Fixes: d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations in progress at shutdown")

The offending commit broke serial console more generally by breaking TX
and thus hanging the system when stopping the getty on reboot.

The underlying bug has been there since this driver was first merged,
and as fixing it properly is going to be a bit involved, I was about to
post a patch equivalent to this one to fix the immediate regression and
get us back to status quo.

> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

> ---
> 
>  drivers/tty/serial/qcom_geni_serial.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index d69592e5e2ec..74a0e074c2de 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1070,8 +1070,10 @@ static int setup_fifos(struct qcom_geni_serial_port *port)
>  static void qcom_geni_serial_shutdown(struct uart_port *uport)
>  {
>  	disable_irq(uport->irq);
> -	qcom_geni_serial_stop_tx(uport);
> -	qcom_geni_serial_stop_rx(uport);
> +	if (!uart_console(uport)) {
> +		qcom_geni_serial_stop_tx(uport);
> +		qcom_geni_serial_stop_rx(uport);
> +	}
>  }
>  
>  static int qcom_geni_serial_port_setup(struct uart_port *uport)

Johan


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
