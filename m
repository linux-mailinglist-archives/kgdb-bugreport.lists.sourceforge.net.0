Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B51D1CAA39
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 May 2020 14:02:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jX1iK-0005f8-Ab
	for lists+kgdb-bugreport@lfdr.de; Fri, 08 May 2020 12:02:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jX1iI-0005eU-V4
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 May 2020 12:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lNKVrkJdHzfMbK2WFg5Y7tu/Zp5ibf2iNC5EM1tQRJo=; b=J+MVY3hJ7mM7XCwbZTnJ6UcEny
 xtAtLX9Cqr0yp/qJOvc0EUgU0cr9oraqjOz/wHRptW1HfmwzbKTMg4OQLmOKVrd4D8qJkjQsE6jNx
 //ehGzf03dJlPXGTUEY9cDFjloswsL/v5hjUoUil+8ZvGAM8L+HklTQ6R/OodTGBGIW0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lNKVrkJdHzfMbK2WFg5Y7tu/Zp5ibf2iNC5EM1tQRJo=; b=aQ8jdGKPsMwN4xr8TDT5ZFRrqy
 AQonBjJ0uaWtQEweZm4VD0ccbcF4mHLbjlgvHi1FvubA9VnDf8WhtiRHpDEG/a1qME4u/6oXlmv0q
 wGZSA9HuZwnAAS4EwbTvOZG9MPPy1DnBgv7J2fA+DBNsLB+0WOCvgSKS/kIa8qDsUKFA=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jX1iE-001klg-DD
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 May 2020 12:02:46 +0000
Received: by mail-lf1-f68.google.com with SMTP id a4so1190486lfh.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 08 May 2020 05:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lNKVrkJdHzfMbK2WFg5Y7tu/Zp5ibf2iNC5EM1tQRJo=;
 b=ubfbVMHFvkGFqi6/lMGAmUyGcg20V5yh8C00LQp7ohCZxq2z4EmwwX3B73H8EZ7Y6+
 aJCVbMOvPuRCut0Bnl8ET5c2XfZXweuNYjo3brQ6CEYILBG8HhEgVuhFWVWA1BmL+7wr
 PaMOGT8qiPBOFsYR+vprL3K/7EVvJ8oJXMBygdJ6uGjhciK55QG7biHSQuFnHCtyvZe5
 srhzCTXCfW52nQOZMKMQqUcLd8x7Ffk6Kk/ZsU0oOHDAWkNAqGX1e8h1hy8E4RAfCjEQ
 6gCD/cXPSscJnlWgSBvvUILe/g9S3+oDCA5v+IgSinV7FqAm/oZSQvwlhvdPaLD8bWMp
 QpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lNKVrkJdHzfMbK2WFg5Y7tu/Zp5ibf2iNC5EM1tQRJo=;
 b=mJSUMKDSds7EPqjO/0Fp2uTy4uX9klep3qqxul+qgrwDTTBZnMLAFawkP61CUos0ms
 8VfPs/xOJUupEbTRv8222mbXqanVHuVjFoef3263tjJrBvRiRsapSwOh+luvv6z7+KPu
 Aj98VJVL3tbSw+u5pxtCMi99K0WNh5doI/3xocZ5CUqqRmzsFVTUX88ls3jF37LFhLK9
 UkYqD0Xkp43zfrG1Zo4HbuPDiBFS6Dtib58undcKyC59Cd/t0T26kKrmMAxKMr+xS1NO
 mob3NeuIVlRQ1kQ5zLkG6MM1YzQyc8nb7pB/ZwgSAuYfv6+9hWJKdJXXOv2WS/dTgeLs
 D3vA==
X-Gm-Message-State: AOAM532UgQpsUzjleV4IgOvkBmFVxHP/i06AYEsVYRAL+78DE2ESlwGm
 cthXdqz9PIN8pM3c/gejvwNd5cUJ38SW8YEaBvS2ug==
X-Google-Smtp-Source: ABdhPJwC7HcQZBmnzQTCK4sgJwvhh1shXjGpCyyI6P2ffCkh7V87ZwnoziPmO0iHtAk8wnYX7eQKeQNhe8U2VKMv2Qo=
X-Received: by 2002:a19:ccce:: with SMTP id c197mr1688763lfg.59.1588939355636; 
 Fri, 08 May 2020 05:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200507161125.1.I2cce9ac66e141230c3644b8174b6c15d4e769232@changeid>
In-Reply-To: <20200507161125.1.I2cce9ac66e141230c3644b8174b6c15d4e769232@changeid>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 8 May 2020 17:32:24 +0530
Message-ID: <CAFA6WYNbrhiagmqLGOGq+-WRdmbA0Y8FP9PYYsOoerqHeQcmoQ@mail.gmail.com>
To: Douglas Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jX1iE-001klg-DD
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Cleanup math with
 KDB_CMD_HISTORY_COUNT
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
 kgdb-bugreport@lists.sourceforge.net, Chuhong Yuan <hslester96@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, 8 May 2020 at 04:42, Douglas Anderson <dianders@chromium.org> wrote:
>
> From code inspection the math in handle_ctrl_cmd() looks super sketchy
> because it subjects -1 from cmdptr and then does a "%
> KDB_CMD_HISTORY_COUNT".  It turns out that this code works because
> "cmdptr" is unsigned and KDB_CMD_HISTORY_COUNT is a nice power of 2.
> Let's make this a little less sketchy.
>
> This patch should be a no-op.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

>  kernel/debug/kdb/kdb_main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 515379cbf209..6865a0f58d38 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -1108,7 +1108,8 @@ static int handle_ctrl_cmd(char *cmd)
>         switch (*cmd) {
>         case CTRL_P:
>                 if (cmdptr != cmd_tail)
> -                       cmdptr = (cmdptr-1) % KDB_CMD_HISTORY_COUNT;
> +                       cmdptr = (cmdptr + KDB_CMD_HISTORY_COUNT - 1) %
> +                                KDB_CMD_HISTORY_COUNT;
>                 strscpy(cmd_cur, cmd_hist[cmdptr], CMD_BUFLEN);
>                 return 1;
>         case CTRL_N:
> --
> 2.26.2.645.ge9eca65c58-goog
>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
