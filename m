Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B07B1BAA6C
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 27 Apr 2020 18:50:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jT6xe-0005cQ-1O
	for lists+kgdb-bugreport@lfdr.de; Mon, 27 Apr 2020 16:50:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jT6xc-0005c2-IM
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 16:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iaoxedZxnXT61na9+8gBwfFrGXWaoAZVnNqVew8CicM=; b=G03zKSu89uVFg5Jq5mizqIXtjx
 e8YAgoKbhc3WPA3y3ar71LCr1xHd0V5dW1NXYkIC9V4mhwsipnfE9Sm+KrWe5fcFqh1BRr5+7Efrl
 TIdQffYSk/+w/r/AAQPozMJtblJvlQUE24r8fVAgNWaI2W0roRX90HfSPqE392bwGgV4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iaoxedZxnXT61na9+8gBwfFrGXWaoAZVnNqVew8CicM=; b=VFobD/JEb83XVcshK8/3DKatGF
 n2oQ7ddqwdz6lv22T5IviGfpSPi4+5zzRdB39b8Y7xYl61m61VLiGfryzxhqzhTHJQqwwaVhMBJaI
 7VrEi6EiG16djJ2zLICunrbZeX/NUoYBNzGNYjq7aCCp3S8vRPJdex89npE3xPovyP3c=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jT6xa-00GeLQ-3u
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 16:50:24 +0000
Received: by mail-wm1-f65.google.com with SMTP id h4so371834wmb.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 27 Apr 2020 09:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iaoxedZxnXT61na9+8gBwfFrGXWaoAZVnNqVew8CicM=;
 b=DBq0MwYm3T2upLNWVYRbzSBKmNIaSmK7ljQkEE1/W/CM09rU0ZjpzInA+LsmKDA2Oy
 xEMR/LAtw14xIHXftGb3u/7siF/KTUUL2mBtbQ9AwJwMdJmcQ0U2v58CNawZXYgaGW1R
 tyHVahfQ6VozcsVMImFLPLoEUgAknBq1fdn5BVCEKsxt3XD10fZEwTnj9YU5yVu5CdS2
 BTRwpEBnz/Ni++2BKyY05SdGTfbWPqsOsXuyzp+oVytDkPY7b8aT8r1FZR63Lj8oQ7uz
 sbDyOED/LFJx1eBGJt8zlAV+nRr7g011JzhujAn/JnFv9+yH5KO37wNfabh+5LXx8naa
 Lp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iaoxedZxnXT61na9+8gBwfFrGXWaoAZVnNqVew8CicM=;
 b=OPA5CR4EqPb4GhxOR40J0XlqRrDmR0BRTUoy5SNTMNsMKKfTPO6t2esC1i1UGWuuo9
 KBzgI9UfOdXRMfnuSbsdtJrJcqC2dQyIdQzYT5nbzvOJF6lq3gggbkLBepUBzRmeZqMc
 GgttpmJtXT8SDSTphlEnRgRIYO04wfkBNEu+Fc+cZsodQfDzFul1RiGAMqXLFxmf2Y58
 SkfVPnWucTWoG3W8+hZSvV54WS6X6k+CXxyThjBa/fcbot0HBUs6ddrZq6GMCv8zsFRW
 CBMZUTQEa7j9jDR511Q0whk/gDsmlwNHECSDwWdg394tXelInVZiQHUSwroZwNgS76Js
 aZYg==
X-Gm-Message-State: AGi0Pubu5U9F84m93sz07a5KsGHaVyC7oEcNxF4yoDIDUSBu0g8jyDO8
 wbCzSNGs/rV2MRVxtMUmyuaLWw==
X-Google-Smtp-Source: APiQypJbvYoCtlLR99vFq8QFfkPi/is4ISqtGy6KU3OtHIv7qMauFXBPxAfmsHQ6OBM4mF7H/m1gPg==
X-Received: by 2002:a7b:cc0e:: with SMTP id f14mr390337wmh.39.1588006215631;
 Mon, 27 Apr 2020 09:50:15 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id m14sm21580932wrs.76.2020.04.27.09.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 09:50:15 -0700 (PDT)
Date: Mon, 27 Apr 2020 17:50:13 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200427165013.yaikxelzilry3eaf@holly.lan>
References: <20200421211447.193860-1-dianders@chromium.org>
 <20200421141234.v2.9.I8f668556c244776523320a95b09373a86eda11b7@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421141234.v2.9.I8f668556c244776523320a95b09373a86eda11b7@changeid>
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
X-Headers-End: 1jT6xa-00GeLQ-3u
Subject: Re: [Kgdb-bugreport] [PATCH v2 9/9] serial: 8250_early: Support
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
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 kgdb-bugreport@lists.sourceforge.net, hpa@zytor.com, agross@kernel.org,
 bjorn.andersson@linaro.org, jason.wessel@windriver.com, mingo@redhat.com,
 bp@alien8.de, linux-serial@vger.kernel.org, gregkh@linuxfoundation.org,
 jslaby@suse.com, tglx@linutronix.de, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Apr 21, 2020 at 02:14:47PM -0700, Douglas Anderson wrote:
> Implement the read() function in the early console driver.  With
> recent kgdb patches this allows you to use kgdb to debug fairly early
> into the system boot.
> 
> We only bother implementing this if polling is enabled since kgdb
> can't be enabled without that.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
