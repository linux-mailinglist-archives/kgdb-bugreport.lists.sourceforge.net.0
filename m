Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DDE1BAA58
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 27 Apr 2020 18:48:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jT6vn-0004JT-O2
	for lists+kgdb-bugreport@lfdr.de; Mon, 27 Apr 2020 16:48:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jT6vm-0004JI-C4
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 16:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V2IKgBBGeWQaS3nKENTTI6oYzwqYmWY3/5vxajcyiRg=; b=AHnf+IBKEi6R7cxRMdxB8VI+it
 bjLxpU9qeyeBJtlpbfLo7zi/t60OMOqOJhm8MDxoIlVzLIIULgeanmN/acrREaHdMF8qS8+DYouDi
 7punscnF1ddFq3Sc8oLaQYyHT0Bv3yMeYMGzvz/3AtmDRr0Jkt3DlFWYx2ykdQDfOOHY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V2IKgBBGeWQaS3nKENTTI6oYzwqYmWY3/5vxajcyiRg=; b=Z08ls8qQ1E9Awfah78OfVfHGrs
 /ejXb9cFw9Vc0TPPL3wUMZwOTGdetf8a1xGtfEFoRYem4duY04R9LeOGAmuz1bvPUeG6dsv18ViOR
 3MbSaWj2bc7zEiqCVk/Tk0PwPSuNUCWB7ISKx6fa7yrLHdclQGSp1V9s6QjV7I1G0ZkA=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jT6vh-00D0VH-8L
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 16:48:30 +0000
Received: by mail-wm1-f65.google.com with SMTP id r26so413630wmh.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 27 Apr 2020 09:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=V2IKgBBGeWQaS3nKENTTI6oYzwqYmWY3/5vxajcyiRg=;
 b=PW927SF/uC1q91VoVVYQ+1pXnGZTfNMH4wSEMOjVR2xohzu4yp9PaN8dJxdTffySOX
 Xg90snZYIfR+VLNbsD+aeBooFQY9hW3NEw/9WC8Ikg8Ua3CdX9GPiZdqolNYOZDjbOgW
 8nMoVwWgXPDSdBzjyuD773mLMsMK2wxXf5mig/QQUsR9SZEmYcZxvhi1gOQNi/fBDetD
 M2sOiHVkryGE0+k9XDDGVVwPrq/CFRbfFGAFfPhRys7RrcFrr1jI8b4rEFcrFjBdPlG+
 ClCJmIQPMDJNb+VxjUwfW0rLYaSZQtSlHUpG3wiJ9Of7PaDg2cLwtlVdadaEVGFXiIoU
 E5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V2IKgBBGeWQaS3nKENTTI6oYzwqYmWY3/5vxajcyiRg=;
 b=bS8EodRh1ooA6uk5Xj7wkqXX7UqjnlO21Y85XcnjbVPmU0pRnmVQKqQF4u6h6mcpNr
 5dzhDRcBeY2Xe1LoFZHlzyxg+3gLNiAKmRMJoXKQN/OlDwWc3m6J96kSihPefEI9BK9o
 2A2dUuZjf7e4NJEbaSb+Jb0dNLa5yoPMDAKwbAn8leEFxZ/SJ6l3FWVrtU6sDaCFmTmS
 MsuyV0BKrKNbUNf2V15fyXphZ5Kr8EoDfT9S4lMCf7sut7Q8z9iJOwqi35PoUY9vXZuC
 h0k51B+VD5pFjEH8gtiQOtWFLoNsIbijKYcLvELiWba///C8ecn+huJ853fKfBeuB6oB
 UD4Q==
X-Gm-Message-State: AGi0PuYxONjbjlZqv588mGpUvFMTp17QcqasxeRrhjVyQhhLJ2Lj7qaG
 +xpxt4z1AteGF9OVfKtZ2Qkjeg==
X-Google-Smtp-Source: APiQypKZLllr/ppZ5WEDGUG/MlZ92mT/85cNLs+v4f8ofGxIckLH3GUuN5fThqZIftzZJCB3DKPn+Q==
X-Received: by 2002:a1c:ba09:: with SMTP id k9mr387758wmf.176.1588006098658;
 Mon, 27 Apr 2020 09:48:18 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id r20sm15553355wmh.26.2020.04.27.09.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 09:48:18 -0700 (PDT)
Date: Mon, 27 Apr 2020 17:48:16 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200427164816.j4xqw3vvlgoqkmx7@holly.lan>
References: <20200421211447.193860-1-dianders@chromium.org>
 <20200421141234.v2.8.If2deff9679a62c1ce1b8f2558a8635dc837adf8c@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421141234.v2.8.If2deff9679a62c1ce1b8f2558a8635dc837adf8c@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jT6vh-00D0VH-8L
Subject: Re: [Kgdb-bugreport] [PATCH v2 8/9] serial: qcom_geni_serial:
 Support earlycon_kgdboc
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
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 kgdb-bugreport@lists.sourceforge.net, linux-arm-msm@vger.kernel.org,
 hpa@zytor.com, agross@kernel.org, bjorn.andersson@linaro.org,
 jason.wessel@windriver.com, mingo@redhat.com, bp@alien8.de,
 linux-serial@vger.kernel.org, gregkh@linuxfoundation.org, jslaby@suse.com,
 tglx@linutronix.de, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Apr 21, 2020 at 02:14:46PM -0700, Douglas Anderson wrote:
> Implement the read() function in the early console driver.  With
> recent kgdb patches this allows you to use kgdb to debug fairly early
> into the system boot.
> 
> We only bother implementing this if polling is enabled since kgdb
> can't be enabled without that.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v2: None
> 
>  drivers/tty/serial/qcom_geni_serial.c | 32 +++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 6119090ce045..4563d152b39e 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1090,6 +1090,36 @@ static void qcom_geni_serial_earlycon_write(struct console *con,
>  	__qcom_geni_serial_console_write(&dev->port, s, n);
>  }
>  
> +#ifdef CONFIG_CONSOLE_POLL
> +static int qcom_geni_serial_earlycon_read(struct console *con,
> +					  char *s, unsigned int n)
> +{
> +	struct earlycon_device *dev = con->data;
> +	struct uart_port *uport = &dev->port;
> +	int num_read = 0;
> +	int ch;
> +
> +	while (num_read < n) {
> +		ch = qcom_geni_serial_get_char(uport);
> +		if (ch == NO_POLL_CHAR)
> +			break;
> +		s[num_read++] = ch;
> +	}
> +
> +	return num_read;
> +}
> +
> +static void __init qcom_geni_serial_enable_early_read(struct geni_se *se,
> +						      struct console *con)
> +{
> +	geni_se_setup_s_cmd(se, UART_START_READ, 0);
> +	con->read = qcom_geni_serial_earlycon_read;
> +}
> +#else
> +static inline void qcom_geni_serial_enable_early_read(struct geni_se *se,
> +						      struct console *con) { ; }

This is pure nitpicking but since I was passing... why the ; ?


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
